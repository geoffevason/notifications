# Some handy helpers
module ApplicationHelper
  def html_id(record)
    "#{record.class.to_s.downcase}_#{record.id}"
  end

  def like_post_link(post)
    like_or_unlike_link(likeable_object: post, create_path: post_likes_path(post))
  end

  def like_comment_link(comment)
    like_or_unlike_link(likeable_object: comment, create_path: comment_likes_path(comment))
  end

  private

  def like_or_unlike_link(likeable_object: likeable_object, create_path: create_path)
    return unless current_user
    # Run find on array because have already eager loaded the likes.
    current_like = likeable_object.likes.find { |l| l.user == current_user }
    if current_like
      link_to 'Unlike', current_like, method: :delete, class: 'unlike'
    else
      link_to 'Like', create_path, method: :post, class: 'like'
    end
  end
end
