Given /^I am not signed in$/ do
  visit('/users/sign_out')
end

Given /^I am signed in$/ do
  email = 'testing@man.net'
  password = 'secretpass'
  @current_user = User.new(email: email, password: password, password_confirmation: password)
  @current_user.save!

  visit '/users/sign_in'
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button "Sign in"
  visit '/'
end


Given(/^a user "(.*?)" exists$/) do |user_ref|
  user = create_user_with_user_ref(user_ref)
end

Given(/^a user "(.*?)" exists with the name "(.*?)"$/) do |user_ref, name|
  user = create_user_with_user_ref(user_ref)
  user.update_attribute(:name, name)
end

Given /^I am signed in and on the home page$/ do
  step "I am signed in"
  step "I am on the home page"
end

When(/^I sign in as user "(.*?)"$/) do |user_ref|
  if @current_user
    step "I sign out"
  end
  @current_user = @users_hash[user_ref] 
  visit '/users/sign_in'
  fill_in "user_email", with: @current_user.email
  fill_in "user_password", with: @current_user.password
  click_button "Sign in"
  visit '/'
end

When(/^I sign out$/) do
  visit '/'
  if page.has_content?("Sign out")
    click_link("Sign out")
    @current_user = nil
  end
end