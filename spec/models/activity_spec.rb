require 'spec_helper'

describe Activity do
  
  let(:user) { FactoryGirl.create(:user) }
  before { @activity = user.activities.build(content: "Pitching") }
  
  subject { @activity }
  
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }
  
  it { should be_valid }
  
  describe "when user_id is not present" do
    before { @activity.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @activity.content = " " }
    it { should_not be_valid }
  end
  
  describe "with content that is too long" do
    before { @activity.content = "a" *  141 }
    it { should_not be_valid }
  end
end
