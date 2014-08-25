# POst to share your news with the world
class PostsController < AuthenticatedController
  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to root_url
  end

  def show
    @post = Post.where(id: params[:id]).includes(:likes).includes(comments: :likes).first
  end

  private

  def post_params
    params.require(:post).permit(:content).merge(user_id: current_user.id)
  end
end
