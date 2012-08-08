require 'spec_helper'

describe "Static pages" do


  describe "Options page" do

    it "should have the content 'Search for a dilemma'" do
      visit '/static_pages/options'
      page.should have_content('Search for a dilemma')
      page.should have_link('About', href: static_pages_about_path)
      page.should have_link('Contact', href: static_pages_contact_path)
      page.should have_link('Help', href: static_pages_help_path)
    end
  end

  describe "About page" do

      it "should have the content 'About'" do
        visit '/static_pages/about'
        page.should have_content('About')
        page.should have_link('About', href: static_pages_about_path)
        page.should have_link('Contact', href: static_pages_contact_path)
        page.should have_link('Help', href: static_pages_help_path)
        
      end
    end

  describe "Help page" do

      it "should have the content 'Help'" do
        visit '/static_pages/help'
        page.should have_content('Help')
        page.should have_link('About', href: static_pages_about_path)
        page.should have_link('Contact', href: static_pages_contact_path)
        page.should have_link('Help', href: static_pages_help_path)
        
      end      
    end

    describe "Contact page" do

        it "should have the content 'Contact'" do
          visit '/static_pages/contact'
          page.should have_content('Contact')
          page.should have_link('About', href: static_pages_about_path)
          page.should have_link('Contact', href: static_pages_contact_path)
          page.should have_link('Help', href: static_pages_help_path)
          
        end
      end
end


