require 'rails_helper'

describe 'the log-out process for a user' do
  it 'logs out a user' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Log In'
    fill_in 'Email', :with => 'alyssa@alyssa.com'
    fill_in 'Password', :with => 'alyssa'
    click_on 'Log In'
    click_on 'Log Out alyssa@alyssa.com'
    expect(page).to have_content("Log out successful")
  end
end
