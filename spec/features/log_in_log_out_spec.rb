require 'rails_helper'

feature 'Logging in' do
  before :each do
    User.create(name: 'user', email: 'user@email.com', password: 'password')
  end

  scenario 'logging in with correct credentials' do
    visit '/'
    click_link('login')
    within('#login-form') do
      fill_in 'email', with: 'user@email.com'
      fill_in 'password', with: 'password'
    end
    click_button 'login'
    expect(page).to have_content 'welcome!'
  end

  scenario 'logging in with incorrect   credentials' do
    visit '/'
    click_link('login')
    within('#login-form') do
      fill_in 'email', with: 'other_user@email.com'
      fill_in 'password', with: 'wrongpassword'
    end
    click_button 'login'
    expect(page).to have_content 'email or password is invalid.'
  end
end

feature 'Logging out' do
  scenario 'logging out' do
    User.create(name: 'user', email: 'user@email.com', password: 'password')
    visit '/'
    click_link('login')

    within('#login-form') do
      fill_in 'email', with: 'user@email.com'
      fill_in 'password', with: 'password'
    end
    click_button 'login'
    expect(page).to have_content 'welcome!'

    click_link('logout')
    expect(page).to have_content 'you have successfully logged out.'
  end
end