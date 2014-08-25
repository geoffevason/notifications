# Likes are a nested resources for different objects types (eg Post and Comment)
class LikesController < AuthenticatedController
  def create
    load_likeable
    @like = @likeable.likes.create(user: current_user)
    @like.save
    redirect_to root_url
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    redirect_to root_url
  end

  private

  # Likes are nested resources (for create anyway) so the urls look nicer
  # eg - /posts/1/likes  and comments/1/likes
  # So we have to handle different param ids for different object types
  def load_likeable
    @likeable = Post.find(params[:post_id]) if params[:post_id]
    @likeable ||= Comment.find(params[:comment_id]) if params[:comment_id]
  end
end
