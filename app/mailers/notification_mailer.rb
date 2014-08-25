class NotificationMailer < ActionMailer::Base
  default from: 'example@example.com'

  def notification_email(notification)
    return if notification.nil?
    @notification = notification

    self.send(notification.notification_type, notification)
  end

  private

  def comment(notification)
    mail :subject => "#{notification.source_user.name} commented on your post",
         :to => notification.user.email
  end

  def cocomment(notification)
    mail :subject => "#{notification.source_user.name} also commented on #{notification.source_object.post.user.name}'s post",
         :to => notification.user.email
  end

  def like_post (notification)
    mail :subject => "#{notification.source_user.name} liked your post",
         :to => notification.user.email
  end

  def like_comment(notification)
    mail :subject => "#{notification.source_user.name} liked your comment",
         :to => notification.user.email
  end
end
