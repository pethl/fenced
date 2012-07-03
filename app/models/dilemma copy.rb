class Dilemma < ActiveRecord::Base
  attr_accessible :ans_opt, :dilemma, :id, :status, :title

  
  validates :id, :presence =>true, :uniqueness =>true
  validates :title, :presence =>true
  validates :dilemma, :presence =>true
  validates :status, :inclusion => { :in => "Open, Closed, Suspended" }
  validates :ans_opt, :presence =>true
  
  after_initialize :init

      def init
        self.status  ||= "Open"           #will set the default value only if it's nil
      end

      def self.search(search)
        if search
          find(:all, :conditions => ['id LIKE ?', "%#{search}%"])
        else
          find(:all)
        end
      end

has_many :responses
  accepts_nested_attributes_for :responses
 
  

end
