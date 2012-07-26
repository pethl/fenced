require 'spec_helper'

describe "Dilemmas" do

  describe "Index" do

    it "should have the content 'ID'" do
      visit '/dilemmas'
      page.should have_content('ID')
    end
  end
  
  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is wrong!
    @dilemma = Dilemma.new(dilemma: "Lorem ipsum", id: user.id)
  end

  subject { @dilemma }

  it { should respond_to(:dilemma) }
  it { should respond_to(:id) }
end


