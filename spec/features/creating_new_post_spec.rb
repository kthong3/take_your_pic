require 'rails_helper'

feature 'Creating new post' do
  before :each do
    User.create(name: 'user', email: 'user@email.com', password: 'password')
  end

  scenario 'creating new post properly' do
    visit '/'
    click_link('new post')
    within('.post-form') do
      fill_in 'Content', with: 'here is content!'
    end
    click_button 'submit'
    expect(page).to have_content 'here is content!'
  end

  scenario 'creating empty post' do
    visit '/'
    click_link('new post')
    within('.post-form') do
      fill_in 'Content', with: ''
    end
    click_button 'submit'
    expect(page).to have_content "Content can't be blank"
  end
end