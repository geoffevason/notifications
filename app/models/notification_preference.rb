# A user has 1 notification preference for each notification type
# It determines whether or not they want to receive an email
# for the given notification types
class NotificationPreference < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :notification_type, presence: true
end
