# Show the feed or signup page
class HomeController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to new_user_registration_path
      return
    end

    @posts = Post.order(created_at: :desc).limit(20).includes(:likes).includes(:comments => :likes)
    @notifications = current_user.notifications.limit(5)
  end
end
