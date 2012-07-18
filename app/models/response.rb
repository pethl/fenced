# == Schema Information
#
# Table name: responses
#
#  id         :integer         not null, primary key
#  option     :string(255)
#  yes        :string(255)
#  no         :string(255)
#  user       :string(255)
#  dilemma_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Response < ActiveRecord::Base
  belongs_to :dilemma
  attr_accessible :no, :option, :user, :yes, :dilemma_id, :dilemma

 
end
