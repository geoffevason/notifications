require_relative 'comments_notification_manager'
require_relative 'likes_notification_manager'


module Notifications
  # Create notifications based on the source object
  class NotificationsCreationJob
    def perform(source_object)
      obj_type = source_object.class.to_s
      klass = "Notifications::#{obj_type.pluralize}NotificationManager".constantize
      klass.create_notifications_for(source_object)
    end
  end
end
