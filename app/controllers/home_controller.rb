class HomeController < ApplicationController

  def index
    if !user_signed_in?
      redirect_to new_user_registration_path
      return
    end

    @posts = Post.order(created_at: :desc).limit(20).includes(:comments)
  end

end
