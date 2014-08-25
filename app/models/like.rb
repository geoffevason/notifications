# Likes express interest in a comment, or post
class Like < ActiveRecord::Base
  include NotificationSource

  belongs_to :user
  belongs_to :likeable, polymorphic: true

  validates :user, presence: true
  validates :likeable, presence: true
end
