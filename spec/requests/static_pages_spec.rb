require 'spec_helper'

describe "Static pages" do
  
  describe "Home page" do
    
    it "should have the content 'AgreedUpon'" do
      visit '/static_pages/home'
      expect(page).to have_content('AgreedUpon')
    end
    
    it "should have the title 'AgreedUpon | Home'" do
      visit '/static_pages/home'
      expect(page).to have_title('AgreedUpon | Home')
    end
  end
  
  describe "About page" do
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end
    
    it "should have the title 'AgreedUpon | About Us'" do
      visit '/static_pages/about'
      expect(page).to have_title('AgreedUpon | About Us')
    end
  end
  
  describe "Getting Started page" do
    it "should have the content 'Getting Started'" do
      visit '/static_pages/start'
      expect(page).to have_content('Getting Started')
    end
    
    it "should have the title 'AgreedUpon | Getting Started'" do
      visit '/static_pages/start'
      expect(page).to have_title('AgreedUpon | Getting Started')
    end
  end
  
  describe "Mission page" do
    it "should have the content 'Our Mission'" do
      visit '/static_pages/mission'
      expect(page).to have_content('Our Mission')
    end
    
    it "should have the title 'AgreedUpon | Our Mission'" do
      visit '/static_pages/mission'
      expect(page).to have_title('AgreedUpon | Our Mission')
    end
  end
end