require 'spec_helper'

describe Dilemma do

  let(:user) { FactoryGirl.create(:user) }
  before { @dilemma = user.dilemmas.build(dilemma: "Lorem ipsum") }

  subject { @dilemma }

  it { should respond_to(:dilemma) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
    its(:user) { should == user }

  it { should be_valid }
  
  describe "accessible attributes" do
      it "should not allow access to user_id" do
        expect do
          Dilemma.new(user_id: user.id)
        end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
      end    
    end

  describe "when user_id is not present" do
    before { @dilemma.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "when user_id is not present" do
      before { @dilemma.user_id = nil }
      it { should_not be_valid }
    end

    describe "with blank content" do
      before { @dilemma.dilemma = " " }
      it { should_not be_valid }
    end

    describe "with dilemma length that is too long" do
      before { @dilemma.dilemma = "a" * 352 }
      it { should_not be_valid }
    end
end


