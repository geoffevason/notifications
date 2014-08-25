# A notification type is a way of tracking which types of notifications
# we want to track, and allows for users to turn on and off
# notification preferences.

# This is NOT an ActiveRecord model
# While it's conceivable that we could make it one and add new notifcation types
# without code updates, chance are code updates are needed anyway.
class NotificationType
  attr_reader :name, :description

  def initialize(name: name, description: description)
    @name = name
    @description = description
  end

  def self.all
    [ NotificationType.comment,
      NotificationType.cocomment,
      NotificationType.like_comment,
      NotificationType.like_post ]
  end

  def self.like_post
    NotificationType.new(name: 'like_post', description: 'someone likes my post')
  end

  def self.like_comment
    NotificationType.new(name: 'like_comment', description: 'someone likes my comment')
  end

  def self.comment
    NotificationType.new(name: 'comment', description: 'someone comments on my post')
  end

  def self.cocomment
    NotificationType.new(name: 'cocomment', description: "someone comments on a post I've commented on")
  end
end
