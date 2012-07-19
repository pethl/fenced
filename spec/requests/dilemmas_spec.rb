require 'spec_helper'

describe "Dilemmas" do

  describe "Index" do

    it "should have the content 'ID'" do
      visit '/dilemmas'
      page.should have_content('ID')
    end
  end
end


