require 'spec_helper'
feature "Deleting manuals" do
  
  before do
    Factory(:manual, :name => "Example Manual")
  end
  
  scenario "Deleting a project" do
    visit "/"
    click_link "delete"
    visit "/"
    page.should_not have_content("Example Manual")
  end
end