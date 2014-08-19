Given /^I am not signed in/ do
  visit('/users/sign_out')
end

Given /^I am signed in$/ do
  email = 'testing@man.net'
  password = 'secretpass'
  User.new(:email => email, :password => password, :password_confirmation => password).save!

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"
end

Given /^I am signed in and on the home page$/ do
  step "I am signed in"
  step "I am on the home page"
end