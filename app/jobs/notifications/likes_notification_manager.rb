module Notifications
  # Manage notifications for a like
  class LikesNotificationManager
    def self.create_notifications_for(like)
      return unless like

      liked_object = like.likeable
      notification_type = liked_object.is_a?(Post) ? NotificationType.like_post : NotificationType.like_comment

      # Skip the notification if they like their own thing
      if like.user != liked_object.user
        notification = Notification.create!(
            user: liked_object.user,
            notification_type: notification_type.name,
            source_object: like,
            source_user: like.user
        )
      end
    end

    def self.destroy_notifications_for(like)
      return unless like
      Notification.where(source_object_id: like.id, source_object_type: "Like").destroy_all
    end
  end
end
