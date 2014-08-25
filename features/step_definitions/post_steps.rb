Given(/^a post exists$/) do
  @post = FactoryGirl.create(:post)
end

Given(/^a post exists with content "(.*?)"$/) do |content|
  @post = FactoryGirl.create(:post, content: content)
end

Given(/^the user "(.*?)" has created a post$/) do |user_ref|
  user = user_for_user_ref(user_ref)
  @post = FactoryGirl.create(:post, user: user)
end

Given(/^I have created a post$/) do
  expect(@current_user).to be_present
  @post = FactoryGirl.create(:post, user: @current_user)
end
