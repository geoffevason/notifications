# A post is the content that users share
class Post < ActiveRecord::Base
  include Likeable

  belongs_to :user

  validates :content, presence: true
  validates :user, presence: true

  has_many :comments
  has_many :commenters, -> { distinct }, through: :comments, source: :user
end
