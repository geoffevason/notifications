# The User
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :notifications
  has_many :notification_preferences, autosave: true

  has_many :likes
  has_many :comments

  def notification_types_to_send_email_for=(notification_types)
    return unless notification_types && notification_types.is_a?(Array)
    notification_preferences.destroy_all
    for notification_type in notification_types
      notification_preferences.create!(notification_type: notification_type, send_email: true)
    end
  end

  def should_send_email_for_notification_type?(notification_type_name)
    pref = notification_preferences.find { |pref| pref.notification_type == notification_type_name }
    pref && pref.send_email?
  end
end
