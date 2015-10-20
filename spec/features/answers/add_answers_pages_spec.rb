require 'rails_helper'

describe 'the process for adding a question ti an answer' do
  it 'adds an answer to the selected question' do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    visit '/'
    click_on 'Log In'
    fill_in 'Email', :with => 'alyssa@alyssa.com'
    fill_in 'Password', :with => 'alyssa'
    click_on 'Log In'
    click_on 'What is love?'
    click_on "Answer"
    fill_in "Answer", :with => 'Something that hurts'
    click_on "Submit"
    expect(page).to have_content 'Something that hurts'
  end
end
