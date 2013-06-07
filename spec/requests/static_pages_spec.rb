require 'spec_helper'

describe "Static pages" do
  
  subject { page }
  
  shared_examples_for "all static pages" do
    it { should have_content(heading) }
    it { should have_title(full_title(page_title)) }
  end
  
  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'AgreedUpon' }
    let(:page_title) { '' }
    
    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end
  
  describe "About page" do
    before { visit about_path }
    let(:heading)    { 'About Us' }
    let(:page_title) { 'About Us' }
    
    it_should_behave_like "all static pages"
  end
  
  describe "Getting Started page" do
    before { visit start_path }
    let(:heading)     { 'Getting Started' }
    let(:page_title)  { 'Getting Started' }
    
    it_should_behave_like "all static pages"
  end
  
  describe "Mission page" do
    before { visit mission_path }
    let(:heading)    { 'Our Mission' }
    let(:page_title) { 'Our Mission' }
    
    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading)    { 'Contact Us' }
    let(:page_title) { 'Contact Us' }
    
    it_should_behave_like "all static pages"
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "Mission"
    expect(page).to have_title(full_title('Our Mission'))
    click_link "Getting Started"
    expect(page).to have_title(full_title('Getting Started'))
    click_link "About Us"
    expect(page).to have_title(full_title('About Us'))
    click_link "Contact Us"
    expect(page).to have_title(full_title('Contact Us'))
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to have_title(full_title(''))
  end
end