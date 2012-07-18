require 'spec_helper'

describe "Dilemmas" do

  describe "Index" do

    it "should have the content 'Id'" do
      visit '/dilemmas'
      page.should have_content('Id')
    end
  end
end


