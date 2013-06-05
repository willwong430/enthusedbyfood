require 'spec_helper'

describe "Static pages" do
  
  subject { page }
  
  describe "Home page" do
    before { visit root_path }
    
    it { should have_content('AgreedUpon') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
  end
  
  describe "About page" do
    before { visit about_path }
    
    it { should have_content('About Us') }
    it { should have_title(full_title('About Us')) }
  end
  
  describe "Getting Started page" do
    before { visit start_path }
    
    it { should have_content('Getting Started') }
    it { should have_title(full_title('Getting Started')) }
  end
  
  describe "Mission page" do
    before { visit mission_path }
    
    it { should have_content('Our Mission') }
    it { should have_title(full_title('Our Mission')) }
  end

  describe "Contact page" do
    before { visit contact_path }
    
    it { should have_content('Contact Us') }
    it { should have_title(full_title('Contact Us')) }
  end
end