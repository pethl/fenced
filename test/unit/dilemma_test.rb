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

require 'test_helper'

class DilemmaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
