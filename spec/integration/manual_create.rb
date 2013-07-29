require 'spec_helper'
feature 'Creating Manuals' do
  before do
    visit '/'
    click_link 'Create a New Manual'
  end
  
  scenario "can create a manual" do
    fill_in 'Name', :with => 'TextMate 2'    
    click_button 'Save'
    page.should have_content('Your manual has been created.')
  
    manual = Manual.find_by_name("TextMate 2")
    page.current_url.should == manual_url(manual)
    title = "Manuals | TextMate 2"
    find("title").should have_content(title)
  end
  
  scenario "can not create a manual without a name" do
    click_button 'Save'
    page.should have_content("Your manual has not been created.")

  end
  
end


