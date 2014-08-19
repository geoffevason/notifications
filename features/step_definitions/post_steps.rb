Given(/^a post exists$/) do
  @post = FactoryGirl.create(:post)
end

When(/^I add the comment "(.*?)" to the post$/) do |comment_text|
  post_selector = "#post_#{@post.id}"
  within(post_selector) {
    fill_in("Comment", :with => comment_text)
    click_button("Comment")
  }
end


Given(/^the post has a comment$/) do
  @comment = FactoryGirl.create(:comment, post: @post)
end