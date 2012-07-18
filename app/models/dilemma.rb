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
  attr_accessible :ans_opt, :dilemma, :id, :status, :title, :uuid

  
  validates :id, :presence =>true, :uniqueness =>true
  validates :dilemma, :presence =>true
  validates :status, :inclusion => { :in => "Open, Closed, Suspended" }
  validates :ans_opt, :inclusion => { :in => "1, 2, 3" }
  
  after_initialize :init
  
      def init
        self.status  ||= "Open"           #will set the default value only if it's nil
        self.ans_opt  ||= "1"           #will set the default value only if it's nil
        self.title  ||= "1"           #will set the default value only if it's nil
        self.uuid  ||= "101"           #will set the default testingtestingvalue only if it's nil
      end

      def self.search(search)
        if search
          
          find(:all, :conditions => ['id = ?', "#{search}"])
        else
          find(:all)
        end
      end

has_many :responses
  accepts_nested_attributes_for :responses
 
  

end
