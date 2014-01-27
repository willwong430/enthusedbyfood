require 'spec_helper'

describe Activity do
  
  let(:user) { FactoryGirl.create(:user) }
  before { @activity = user.activities.build(content: "Pitching") }
  
  subject { @activity }
  
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:details)}
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
  
  describe "detail associations" do
    it "should destroy associated details" do 
      details = @activity.details.to_a
      @activity.destroy
      expect(details).not_to be_empty
      details.each do |detail|
        expect(Detail.where(id: detail.id)).to be_empty
      end
    end
  end   
end
