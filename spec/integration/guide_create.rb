require 'spec_helper'
feature 'Creating Lists' do
  before do
    visit '/'
    click_link 'New How-to List'
  end
  
  scenario "can create a list" do
    fill_in 'Name', :with => 'TextMate 2'    
    click_button 'Create List'
    page.should have_content('Your list has been created.')
  
    list = List.find_by_name("TextMate 2")
    page.current_url.should == project_url(list)
    title = "How-to List | TextMate 2"
    find("title").should have_content(title)
  end
  
  scenario "can not create a list without a name" do
    click_button 'Create List'
    page.should have_content("Your list has not been created.")
    page.should have_content("Name can't be blank")

  end
  
end


