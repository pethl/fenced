require 'spec_helper'

describe "Static pages" do


  describe "Options page" do

    it "should have the content 'Search for a dilemma'" do
      visit '/static_pages/options'
      page.should have_content('Search for a dilemma')
    end
  end

  describe "About page" do

      it "should have the content 'About FenceDweller'" do
        visit '/static_pages/about'
        page.should have_content('About FenceDweller')
      end
    end

  describe "Help page" do

      it "should have the content 'Help'" do
        visit '/static_pages/help'
        page.should have_content('Help')
      end      
    end

    describe "Contact page" do

        it "should have the content 'Contact FenceDweller'" do
          visit '/static_pages/contact'
          page.should have_content('Contact FenceDweller')
        end
      end
end


