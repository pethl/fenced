require 'spec_helper'

describe "Home" do

  describe "Index page" do

    it "should have the content 'Get Started'" do
      visit '/home/index'
      page.should have_content('Get Started')
    end
  end
end


