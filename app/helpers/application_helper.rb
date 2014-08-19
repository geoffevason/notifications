module ApplicationHelper

  def html_id(record)
    "#{record.class.to_s.downcase}_#{record.id}"
  end


  def like_link(record)
    if user_signed_in?
      like = Like.where(user:current_user, likeable:record).first
      if like
        link_to 'Unlike', like, method: :delete, class: 'unlike'#, :remote => true, 'data-class' => 'post', 'data-id' => post.id, :title => 'Unlike'
      else
        link_to 'Like', likes_path(likeable_type: record.class.to_s, likeable_id: record.id), :method => :post, :class => 'like'#, :remote => true, 'data-class' => 'post', 'data-id' => post.id, :title => 'Like'
      end
    end
  end
end
