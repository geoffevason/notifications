class NotificationMailer < ActionMailer::Base
  default from: 'example@example.com'

  def notification_email(notification)
    return if notification.nil?

    @notification = notification
    @source_user = notification.source_user
    @notified_user = notification.user

    mail(
        to: @notified_user.email,
        content_type:  "multipart/alternative",
        subject: subject_for_notification(notification)
    )
  end

  private

  def subject_for_notification(notification)
    case notification.notification_type
      when 'comment'
        "#{@source_user.name} commented on your post"
      when 'cocomment'
        comment = notification.source_object
        post = comment.post
        original_poster = post.user
        "#{@source_user.name} also commented on #{original_poster.name}'s post"
      when 'like_post'
        "#{@source_user.name} liked your post"
      when 'like_comment'
        "#{@source_user.name} liked your comment"
    end
  end
end
