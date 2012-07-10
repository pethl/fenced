class Response < ActiveRecord::Base
  belongs_to :dilemma
  attr_accessible :no, :option, :user, :yes, :dilemma_id, :dilemma

 
end
