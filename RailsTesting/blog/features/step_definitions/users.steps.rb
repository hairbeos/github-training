require 'bcrypt'

Given(/^the following user records$/) do |table|
  table.hashes.each do |hash|
    create(:user, hash)
  end
end

Given(/^I login as "(.*?)"\/"(.*?)"$/) do |username, password|
  visit login_path
  fill_in "Username",  with: username
  fill_in "Password",  with: password
  click_button "Login" 
end

When(/^I visit "(.*?)" profile link$/) do |username|
  user = User.find_by_username(username)
  visit user_url(user)
end

Then(/^I should not see "(.*?)"$/) do |content|
  page.should_not have_content(content)
end

### Authentication steps
Given(/^the following username: "(.*?)", password: "(.*?)"$/) do |user, pass|
  create(:user, username: user, password: pass)
end

When(/^I visit the login page$/) do
  visit login_path
end

### Signup steps
When(/^I visit the signup page$/) do
  visit signup_path
end

Then(/^Password should be encrypted$/) do
  user = User.first
  if user
    # BCrypt::Engine.valid_salt?(user.password_salt).should be_true &&
    BCrypt::Engine.valid_secret?(user.password_hash).should be_true
  end
end
