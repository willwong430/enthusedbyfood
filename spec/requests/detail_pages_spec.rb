require 'spec_helper'

describe "Detail Pages" do
  
  subject { page }
  
  let(:user) { FactoryGirl.create(:user)}
  before { sign_in user}
  
  describe "detail creation" do
    before { visit root_path }
    
    describe "with valid information" do
      before { click_button "Add more details" }
      
      it "should create additional details about adventure" do
        before { click_button "Submit" }
        it { should have_xpath("//input[@value=]")} 
      end
end
