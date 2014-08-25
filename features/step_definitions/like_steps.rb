Given(/^I have liked the post$/) do
  @post.likes.create(user: @current_user)
end

Given(/^I have liked the comment/) do
  @comment.likes.create(user: @current_user)
end

Given(/^the user "(.*?)" has liked the post$/) do |user_ref|
  user = user_for_user_ref(user_ref)
  @like = FactoryGirl.create(:like, likeable: @post, user: user)
end

Given(/^the user "(.*?)" has liked the comment$/) do |user_ref|
  user = user_for_user_ref(user_ref)
  @like = FactoryGirl.create(:like, likeable: @comment, user: user)
end

Given(/^the post has (\d+) likes?$/) do |likes_count|
  likes_count.to_i.times do
    FactoryGirl.create(:like, likeable: @post)
  end
end

Given(/^the comment has (\d+) likes?$/) do |likes_count|
  likes_count.to_i.times do
    FactoryGirl.create(:like, likeable: @comment)
  end
end


When(/^I like the post$/) do
  post_selector = '#'+html_id(@post)
  within(post_selector) {
    click_link("Like")
  }
end

When(/^I unlike the post$/) do
  post_selector = '#'+html_id(@post)
  within(post_selector) {
    click_link("Unlike")
  }
end

When(/^I like the comment$/) do
  post_selector = '#'+html_id(@comment)
  within(post_selector) {
    click_link("Like")
  }
end

When(/^another user "(.*?)" likes the post$/) do |user_ref|
  user = user_for_user_ref(user_ref)
  post = load_or_create_post
  FactoryGirl.create(:like, user: user, likeable: post)
end

When(/^another user "(.*?)" likes the comment$/) do |user_ref|
  user = user_for_user_ref(user_ref)
  FactoryGirl.create(:like, user: user, likeable: @comment)
end


Then(/^the post should have (\d+) likes?$/) do |likes_count|
  expect(@post.likes.count).to eq(likes_count.to_i)
end

Then(/^the comment should have (\d+) likes?$/) do |likes_count|
  expect(@comment.likes.count).to eq(likes_count.to_i)
end




