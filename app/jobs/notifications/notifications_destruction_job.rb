module Notifications
  # Destroy notifications based on the source object
  class NotificationsDestructionJob
    def perform(source_object)
      obj_type = source_object.class.to_s
      klass = "Notifications::#{obj_type.pluralize}NotificationManager".constantize
      klass.destroy_notifications_for(source_object)
    end
  end
end
