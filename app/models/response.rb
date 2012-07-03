class Response < ActiveRecord::Base
  belongs_to :dilemma
  attr_accessible :no, :option, :user, :yes, :dilemma_id, :dilemma


   validates :yes, :presence => { :message => " or  No are acceptable answers.... would you like to select one?" }
   
end
