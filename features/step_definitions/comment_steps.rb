Given(/^the post has a comment$/) do
  @comment = FactoryGirl.create(:comment, post: @post)
end

Given(/^the post has (\d+) comments?$/) do |comment_count|
  comment_count.to_i.times do
    FactoryGirl.create(:comment, post: @post)
  end
end

Given(/^the user "(.*?)" has commented on the post$/) do |user_ref|
  user = user_for_user_ref(user_ref)
  @comment = FactoryGirl.create(:comment, post: @post, user: user)
end

Given(/^I have commented on a post$/) do
  @post = FactoryGirl.create(:post)
  @comment = FactoryGirl.create(:comment, post: @post, user: @current_user)
end

Given(/^I have commented on the post$/) do
  @comment = FactoryGirl.create(:comment, post: @post, user: @current_user)
end

When(/^I add the comment "(.*?)" to the post$/) do |comment_text|
  post_selector = '#'+html_id(@post)
  within(post_selector) {
    fill_in("Comment", with: comment_text)
    click_button("Comment")
  }
  @comment = Comment.last
end

When(/^I comment on the post$/) do 
  post_selector = '#'+html_id(@post)
  within(post_selector) {
    fill_in("Comment", with: "This is my comment")
    click_button("Comment")
  }
end

When(/^I delete the comment$/) do
  comment_selector = '#'+html_id(@comment)
  within(comment_selector) {
    click_link("Delete")
  }
end

When(/^another user "(.*?)" comments on the post$/) do |user_ref|
  user = user_for_user_ref(user_ref)
  post = load_or_create_post
  @comment = FactoryGirl.create(:comment, user: user, post: post)
end


Then(/^I should see the comment$/) do
  expect(page).to have_content(@comment.content)
end





