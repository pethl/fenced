require 'spec_helper'

describe "Dilemmas" do

  describe "Show" do

    it "should have the content 'id'" do
      visit '/dilemmas/show'
      page.should have_content('id')
    end
  end
end


