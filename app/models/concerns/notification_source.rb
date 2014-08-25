require_relative '../../jobs/notifications/notifications_creation_job'
require_relative '../../jobs/notifications/notifications_destruction_job'

# The creation of deletion of an object that includes this
# will trigger the creation or destruction of Notification
# objects.
module NotificationSource
  extend ActiveSupport::Concern

  included do
    after_create :register_notifications
    after_destroy :unregister_notifications
  end

  def register_notifications
    job = Notifications::NotificationsCreationJob.new
    job.perform(self)
  end

  def unregister_notifications
    job = Notifications::NotificationsDestructionJob.new
    # Run it right away (for now) so the object is still available
    job.perform(self)
  end
end
