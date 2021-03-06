# == Schema Information
#
# Table name: dilemmas
#
#  id              :integer         not null, primary key
#  uuid            :string(36)
#  title           :string(255)
#  dilemma         :text
#  status          :string(255)
#  ans_opt         :string(255)
#  shorten_url     :string(255)
#  close_timestamp :datetime
#  user_id         :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class Dilemma < ActiveRecord::Base
  attr_accessible :ans_opt, :dilemma, :id, :status, :title, :uuid, :close_timestamp
  belongs_to :user
  validates :user_id, presence: true
  after_find :status_check

  
  validates :id, :uniqueness =>true
  validates :dilemma, :presence =>true
   validates :dilemma, length: { maximum: 350 }
  validates :status, :inclusion => { :in => "Open, Closed, Suspended" }
  validates :ans_opt, :inclusion => { :in => "1, 2, 3" }
    validates :title, :presence =>true, :inclusion => { :in => "1, 2, 3, 4" }
  
  after_initialize :init
  
      def init
        self.status  ||= "Open"           #will set the default value only if it's nil
        self.ans_opt  ||= "1"           #will set the default value only if it's nil
        self.title  ||= "1"           #will set the default value only if it's nil
     end

      def self.search(search)
        if search
          
          find(:all, :conditions => ['id = ?', "#{search}"])
        else
          find(:all)
        end
      end


has_many :responses, dependent: :destroy
  accepts_nested_attributes_for :responses
 
 before_create :create_randomid
   before_create :bitly_body
   before_create :initial_post_twitter
   before_save :set_close_time
   
 
  private
      def status_check
        if self.close_timestamp < Time.now
          self.status = "Closed"
        else  
          self.status = "Open"  
      end
      end



      def create_randomid
          id = SecureRandom.random_number.to_s
          id = id[12..-1]
          id = id.to_i
          self.id = id
      end
  
      def bitly_body
          t = self.id.to_s
          long_url= "https://fenced.herokuapp.com/dilemmas/" + t
          Bitly.use_api_version_3
          bitly = Bitly.new('fencedweller','R_7b81aebd65ac551c78983d0ae57a0253')
          body = bitly.shorten(long_url)  
          self.shorten_url = body.short_url
      end
      
      def set_close_time
          if self.created_at.nil?
            x = Time.now
          else
            x = self.created_at
        end 
        
        if self.title == "1"
              self.close_timestamp =  x + 2.hours
        elsif self.title == "2"
              self.close_timestamp = x + 25.hours
        elsif self.title == "3"
              self.close_timestamp = x + 1.week
        else self.title == "3"
              self.close_timestamp = x + 1.month
        end
      end
      
      
      
      def initial_post_twitter
        require 'twitter'
        require 'oauth'
        user = self.user.twittername.to_s
        tweet = "@" + user + ": Follow this link to vote on my dilemma - " + self.shorten_url
        Twitter.update(tweet)
      end
  default_scope order: 'dilemmas.created_at DESC'    
end
