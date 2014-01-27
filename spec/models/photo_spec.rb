# require 'spec_helper'
# 
# describe Photo do
#   let(:user) { FactoryGirl.create(:user) }
#   before do
#     @filename = "rails.png"
#     @photo = @user.photos.build(:photo, :user_file => File.open(@filename), :to => @user_id)
#   end
#   
#   subject { @photo }
#   
#   it { should respond_to(:user_id) }
#   # it { should respond_to(:content_type) }
#   it { should respond_to(:filename) }
#   it { should respond_to(:size) }
#   it { should respond_to(:width) }
#   it { should respond_to(:height) }
#   
#   it { should be_valid }
#   
#   # describe "when user_id is not present" do
#   #   before { }
#   
# end
