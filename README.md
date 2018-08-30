# TakeYourPic

## Project Description
Photo-sharing application that allows users to upload photos. Users can add a caption to each of their posts and use hashtags  to make them searchable by other users within the app.

## App Features (currently)
- User creation
- Upload photos with captions
- View photos from other users

## Tech Stack 
Ruby 2.5.0  
Rails 5.1.4  
Postgresql 10

## System Requirements to Run Locally
Must have on your machine:
  - Ruby on Rails: `rails` and `ruby` (possibly through RVM or rbenv)
  - `git`
  - PSQL (`postgresql`)

## Running Locally
- Clone the git repository to your local machine.
- Install the Bundler gem (if you do not have it already): `gem install bundler`
- Bundle install the gems in the Gemfile: `bundle install`
- Create the database: `bundle exec rake db:create`
- Migrate the database: `bundle exec rake db:migrate`
- Fill the database with seed data: `bundle exec rake db:seed`
- Start the server:  `rails server` or simply `rails s` (hosts local server at `localhost:3000`)
- Visit http://localhost:3000

## Challenges
- Understanding how to use rails credentials and active storage vs. using dotenv gem to hide secret info
- Using media queries with CSS grid was tricky and a little tedious.

## Next Steps
- Update testing to include usernames
- Implement continuous integration with testing
- Refactor current code and clean up views
- Improve styling: consistent row sizes
- Add search feature to search by username
- Add hashtag feature to make posts searchable
- Implement adding comments to posts
- Allow users to review edits
- Allow users to flag and favorite posts
- Add profile page for users
- Allow users to follow each other
