require 'rails_helper'

feature 'Signing up' do
  scenario 'signing up with correct credentials' do
    visit '/'
    click_link('sign up')
    within('#signup-form') do
      fill_in 'Name', with: 'user'
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
    end
    click_button 'sign up'
    expect(page).to have_content 'thank you for signing up!'
  end

  scenario 'signing up with incorrect credentials' do
    visit '/'
    click_link('sign up')
    within('#signup-form') do
      fill_in 'Name', with: 'user'
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: ''
      fill_in 'Password confirmation', with: ''
    end
    click_button 'sign up'
    expect(page).to have_content 'form is invalid.'
  end
end
