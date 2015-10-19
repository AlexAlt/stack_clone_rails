require 'rails_helper'

describe 'the log-in process for a user' do
  it 'logs in a user' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Log In'
    fill_in 'Email', :with => 'alyssa@alyssa.com'
    fill_in 'Password', :with => 'alyssa'
    click_on 'Log In'
    expect(page).to have_content("Logged in.")
  end
end
