require 'rails_helper'

feature 'Viewing a new post' do
  before :each do
    User.create(name: 'user', email: 'user@email.com', password: 'password')
    Post.create(content: 'here is content!')
  end

  scenario 'viewing new post that was created' do
    visit '/'

    within('.posts') do
      click_link('here is content!')
    end
    expect(page).to have_content 'here is content!'
  end
end

feature 'Editing a post' do
  before :each do
    User.create(name: 'user', email: 'user@email.com', password: 'password')
    Post.create(content: 'here is content')
  end

  scenario 'editing a post that was created' do
    visit '/'
    click_link('here is content')
    click_link('edit post')

    within('.post-form') do
      fill_in 'Content', with: 'here is content!!'
    end
    click_button 'submit'

    expect(page).to have_content 'here is content!!'
  end
end