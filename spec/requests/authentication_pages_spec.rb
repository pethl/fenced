require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('title', text: 'Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

            it { should have_selector('title', text: user.fullname) }
            it { should have_link('View Profile',  href: user_path(user)) }
            it { should have_link('Update Profile', href: edit_user_path(user)) }
            it { should have_link('Sign out', href: signout_path) }
            it { should_not have_link('Sign in', href: signin_path) }
          end
          describe "authorization" do
            
            describe "as non-admin user" do
                  let(:user) { FactoryGirl.create(:user) }
                  let(:non_admin) { FactoryGirl.create(:user) }

                  before { sign_in non_admin }

                  describe "submitting a DELETE request to the Users#destroy action" do
                    before { delete user_path(user) }
                    specify { response.should redirect_to(root_path) }        
                  end
                end

              describe "for non-signed-in users" do
                let(:user) { FactoryGirl.create(:user) }

                describe "in the Users controller" do

                  describe "visiting the edit page" do
                    before { visit edit_user_path(user) }
                    it { should have_selector('title', text: 'Sign in') }
                  end

                  describe "submitting to the update action" do
                    before { put user_path(user) }
                    specify { response.should redirect_to(signin_path) }
                  end
                end
              end
            end

end