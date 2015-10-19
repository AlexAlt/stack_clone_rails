require 'rails_helper'

describe 'the process to add a question' do
  it 'add a user' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Log In'
    fill_in 'Email', :with => 'alyssa@alyssa.com'
    fill_in 'Password', :with => 'alyssa'
    click_on 'Log In'
    click_on 'Ask Question'
    fill_in 'Title', :with => 'Title'
    fill_in 'Content', :with => 'Content'
    click_on 'Submit'
    expect(page).to have_content 'Added!'
  end

  it 'give an error if info is entered improperly' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Log In'
    fill_in 'Email', :with => 'alyssa@alyssa.com'
    fill_in 'Password', :with => 'alyssa'
    click_on 'Log In'
    click_on 'Ask Question'
    fill_in 'Title', :with => ''
    fill_in 'Content', :with => ''
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end
end
