require 'spec_helper'

describe "Static pages" do


  describe "Options page" do

    it "should have the content 'Search for a dilemma'" do
      visit '/static_pages/options'
      page.should have_content('Search for a dilemma')
    end
  end

  describe "About page" do

      it "should have the content 'About Us'" do
        visit '/static_pages/about'
        page.should have_content('About Us')
      end
    end

  describe "Help page" do

      it "should have the content 'Help'" do
        visit '/static_pages/help'
        page.should have_content('Help')
      end      
    end


end


