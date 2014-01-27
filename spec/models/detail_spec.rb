require 'spec_helper'

describe Detail do
  let(:user) { FactoryGirl.create(:user) }
  let(:activity) { FactoryGirl.create(:activity) }
  before do
    @detail = activity.details.build(who: "Will", what: "Dagwood Sammich",
                                       where: "Joseph Leonard", when: Time.now,
                                       why: "Dagwood Sammich", how: 8.0)
  end
  
  subject { @detail }
  
  it { should respond_to(:activity) }
  it { should respond_to(:activity_id) }
  it { should respond_to(:who)}
  it { should respond_to(:what)}
  it { should respond_to(:when)}
  it { should respond_to(:where)}
  it { should respond_to(:why)}
  it { should respond_to(:how)}
  its(:activity) { should eq activity }
  
  describe "when activity_id is not present" do
    before { @detail.activity_id = nil }
    it { should_not be_valid }
  end
  
  describe "description of the company is too long" do
    before { @detail.who = "a" * 141 }
    it { should_not be_valid }
  end
  
  describe "description of the ingredients is too long" do
    before { @detail.what = "a" *  141 }
    it { should_not be_valid }
  end
    
  describe "description of the location is too long" do
    before { @detail.where = "a" *  141 }
    it { should_not be_valid }
  end
  
  describe "description of the why is too long" do
    before { @detail.why = "a" *  141 }
    it { should_not be_valid }
  end
  
end
