# Notifications
module Notifications
  # Manage notifications for a comment
  class CommentsNotificationManager
    def self.create_notifications_for(comment)
      return unless comment

      create_comment_notifications_for(comment)
      create_cocomment_notifications_for(comment)
    end

    def self.destroy_notifications_for(comment)
      return unless comment
      Notification.where(source_object_id: comment.id, source_object_type: "Comment").destroy_all
    end

    private

    def self.create_comment_notifications_for(comment)
      post = comment.post

      if comment.user != post.user
        notification = Notification.create(
            user: post.user,
            notification_type: NotificationType.comment.name,
            source_object: comment,
            source_user: comment.user
        )
      end
    end

    def self.create_cocomment_notifications_for(comment)
      post = comment.post

      # Don't notify the commenter or the original poster
      # since if the original poster commented on their own
      # post they don't want 2 notifications
      users_to_notify = comment.post.commenters - [comment.user, post.user]
      users_to_notify.each do |user|
        notification = Notification.create(
            user: user,
            notification_type: NotificationType.cocomment.name,
            source_object: comment,
            source_user: comment.user
        )
      end
    end
  end
end
