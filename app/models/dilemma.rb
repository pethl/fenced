# == Schema Information
#
# Table name: dilemmas
#
#  id         :integer         not null, primary key
#  uuid       :string(36)
#  title      :string(255)
#  dilemma    :text
#  status     :string(255)
#  ans_opt    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Dilemma < ActiveRecord::Base
  attr_accessible :ans_opt, :dilemma, :id, :status, :title, :uuid, :close_timestamp
  belongs_to :user
  validates :user_id, presence: true

  
  validates :id, :uniqueness =>true
  validates :dilemma, :presence =>true
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
   before_create :set_close_time
   before_create :initial_post_twitter
 
  private

      def create_randomid
          id = SecureRandom.random_number.to_s
          id = id[12..-1]
          id = id.to_i
          self.id = id
      end
  
      def bitly_body
          t = self.id.to_s
          long_url= "http://fenced.herokuapp.com/dilemmas/" + t
          Bitly.use_api_version_3
          bitly = Bitly.new('fencedweller','R_7b81aebd65ac551c78983d0ae57a0253')
          body = bitly.shorten(long_url)  
                  self.shorten_url = body.short_url
      end
      
      def set_close_time
        
        if self.title == "1"
                  self.close_timestamp = 2.hours.from_now
        elsif self.title == "2"
                  self.close_timestamp = 25.hours.from_now
          elsif self.title == "3"
                  self.close_timestamp = 1.week.from_now
          else self.title == "3"
                  self.close_timestamp = 1.month.from_now
        end
      end
      
      
      def initial_post_twitter
        require 'twitter'
        require 'oauth'
        user = self.user_id.to_s
        tweet = "@" + user + ": Follow this link to vote on my dilemma - " + self.shorten_url
        Twitter.update(tweet)
      end
  default_scope order: 'dilemmas.created_at DESC'    
end
