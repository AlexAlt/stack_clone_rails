require 'rails_helper'

describe 'the process for editing a question of an answer' do
  it 'edits an answer to the selected question' do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    answer = FactoryGirl.create(:answer)
    visit '/'
    click_on 'Log In'
    fill_in 'Email', :with => 'alyssa@alyssa.com'
    fill_in 'Password', :with => 'alyssa'
    click_on 'Log In'
    click_on 'What is love?'
    click_on "Answer"
    fill_in "Answer", :with => 'Something that hurts'
    click_on "Submit"
    click_on ""
    fill_in "Answer", :with => 'Baby dont hurt me'
    click_on "Submit"
    expect(page).to have_content 'Baby'
  end
end
