# Comments on posts
class CommentsController < AuthenticatedController
  def create
    load_post
    @comment = @post.comments.new(comment_params)
    @comment.save
    redirect_to root_url
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to root_url
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id).merge(user: current_user)
  end

  def load_post
    @post = Post.find(params[:post_id])
  end
end
