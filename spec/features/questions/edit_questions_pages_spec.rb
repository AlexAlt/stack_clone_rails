require 'rails_helper'

describe 'the process to edit a question' do
  it 'edits a question' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Log In'
    fill_in 'Email', :with => 'alyssa@alyssa.com'
    fill_in 'Password', :with => 'alyssa'
    click_on 'Log In'
    click_on 'Ask Question'
    fill_in "Title", :with => 'What is love?'
    fill_in "Content/Description", :with => 'Please explain in English'
    click_on "Submit"
    click_on 'What is love?'
    click_on 'Edit'
    fill_in 'Title', :with => 'What is LOVE?'
    fill_in "Content/Description", :with => 'Please explain in English'
    click_on "Submit"
    expect(page).to have_content 'What is LOVE?'
  end

end
