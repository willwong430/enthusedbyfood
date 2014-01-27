require 'spec_helper'

describe "Activity pages" do
  
  subject { page }
  
  let(:user) { FactoryGirl.create(:user) }
  
  before do 
    sign_in user
    visit root_path
  end
  
  describe "activity creation" do
    
    describe "with invalid information" do 

      it "should not create an activity" do
        expect { click_button "Share" }.not_to change(Activity, :count)
      end
      
      describe "error messages" do
        before { click_button "Share" }
        it { should have_content('error') }
      end
    end
    
    describe "with valid information" do
      
      before { fill_in 'activity_content', with: "Lorem ipsum" }
      
      it "should create an activity" do
        expect { click_button "Share" }.to change(Activity, :count).by(1)
      end
        
      describe "activity counter should increase by 1" do
        it { should have_content(user.activities.count) }  
      end
      
      describe "pagination" do

        before(:all) { 50.times { FactoryGirl.create(:activity, user: user, content: "foo" ) } }
        after(:all) { Activity.delete_all}

        it { should have_selector('div.pagination') }

        it "should list each activity" do
          Activity.paginate(page: 1).each do |post|
            expect(page).to have_selector('li', text: "foo")        
          end
        end
      end
        
      describe "adding additional details" do
        before { click_button "Add more details" }
        
        it { should have_label("How would you rate it on the awesome meter?") }
      end
    
    end
  end

  describe "activity destruction" do
    
    before { FactoryGirl.create(:activity, user: user) }
    
    describe "as correct user" do
      
      before { visit root_path }
      it "should delete an activity" do
        expect { click_link "delete" }.to change(Activity, :count).by(-1)
      end
    end
    
    describe "as incorrect user" do
      let(:other_user) { FactoryGirl.create(:user) }
      let(:other_user_activity) { FactoryGirl.create(:activity, user: other_user, content: "foobar") }
      
      before { visit user_path(other_user) }
      
      describe "should not be able to delete other user's activity" do
        it { should_not have_link('delete') }
      end
    end
  end
end
