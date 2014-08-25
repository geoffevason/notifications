# A Notification is the actual object that gets created when something
# happens that a user should be notified about. For example - if someone
# comments on a post - then notification objects will be created for:
# - the original poster
# - every person that has commented on that post
# After the notification objects are created, emails will be sent out
# based on the each user's NotificationPreferences
class Notification < ActiveRecord::Base
  # Who the notification is for
  belongs_to :user
  # The person who performed an action which triggered the notification
  belongs_to :source_user, class_name: 'User'
  # The object that trigger the notification
  belongs_to :source_object, polymorphic: true

  validates :user, presence: true
  validates :source_user, presence: true
  validates :source_object, presence: true
  validates :notification_type, presence: true

  after_create :process

  def process
    return if processed?
    if self.user.should_send_email_for_notification_type?(notification_type)
      NotificationMailer.notification_email(self).deliver
    end
    self.update_attribute(:processed, true)
  end
end
