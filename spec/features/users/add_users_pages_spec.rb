require 'rails_helper'

describe 'the process to add a user' do
  it 'add a user' do
    visit new_user_path
    fill_in 'Display Name', :with => 'Alyssa Horrocks'
    fill_in 'E-Mail', :with => 'alyssa@horrocks.com'
    fill_in 'Password', :with => 'alyssa'
    fill_in 'Confirm Password', :with => 'alyssa'
    click_on 'Submit'
    expect(page).to have_content 'Nailed it!!'
  end

  it 'give a user if info is entered improperly' do
    fill_in 'Display Name', :with => ''
    fill_in 'E-Mail', :with => ''
    fill_in 'Password', :with => ''
    fill_in 'Confirm Password', :with => ''
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end
end
