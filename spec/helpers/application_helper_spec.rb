require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  context "html_id" do
    it "should use the right class and id" do
      post = FactoryGirl.create(:post)
      expect(helper.html_id(post)).to eq("post_#{post.id}")

      comment = FactoryGirl.create(:comment)
      expect(helper.html_id(comment)).to eq("comment_#{comment.id}")
    end
  end
end
