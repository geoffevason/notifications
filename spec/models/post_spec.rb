require 'rails_helper'

describe Post do
  context 'required attributes' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:user) }
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  context '#comments' do
    it "should have comments" do
      @post = FactoryGirl.create(:post)
      @user = FactoryGirl.create(:user)
      @comment1 = FactoryGirl.create(:comment, :user => @user, :post => @post)
      @comment2 = FactoryGirl.create(:comment, :user => @user, :post => @post)

      expect(@post.comments.count).to eq(2)
    end
  end

  context "#commenters" do
    before do
      @post = FactoryGirl.create(:post)
      @user = FactoryGirl.create(:user)
    end

    it "should contain users who commented on the post" do
      @comment = FactoryGirl.create(:comment, :user => @user, :post => @post)
      expect(@post.commenters).to include(@user)
    end

    it "should contain only unique commentors" do
      @comment = FactoryGirl.create(:comment, :user => @user, :post => @post)
      @comment2 = FactoryGirl.create(:comment, :user => @user, :post => @post)
      expect(@post.commenters.count).to eq(1)
      expect(@post.commenters).to eq([@user])
    end

    # it "should not contain users who deleted their comments" do
    #   @comment.disable!
    #   @post.reload
    #   expect(commenters).not_to include(@user)
    # end
  end
end
