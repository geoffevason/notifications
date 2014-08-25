# Comments on posts
class CommentsController < AuthenticatedController
  respond_to :html, :js

  def create
    load_post
    @comment = @post.comments.new(comment_params)
    @comment.save
    respond_with(@comment, :location => root_path)
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @post = @comment.post
    @comment.destroy
    respond_with(@comment, :location => root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id).merge(user: current_user)
  end

  def load_post
    @post = Post.find(params[:post_id])
  end
end
