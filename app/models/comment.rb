# Comments are used to discuss posts
class Comment < ActiveRecord::Base
  include Likeable
  include NotificationSource

  belongs_to :user
  belongs_to :post

  validates :content, presence: true
  validates :user, presence: true
  validates :post, presence: true
end
