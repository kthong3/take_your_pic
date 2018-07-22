require 'rails_helper'

feature 'Editing a post' do
  before :each do
    User.create(name: 'user', email: 'user@email.com', password: 'password')
    Post.create(content: 'here is content')
  end

  scenario 'deleting a post that was created' do
    visit '/'
    click_link('here is content')
    click_link('delete post')

    expect(page).to have_content 'post was successfully deleted.'
    expect(page).to have_no_content 'here is content'
  end
end