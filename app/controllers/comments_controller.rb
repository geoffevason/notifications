class CommentsController < AuthenticatedController

  before_filter :get_post

  def create
    @comment = @post.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        # format.js   { render 'records/create.js.erb' }
        format.html { redirect_to root_url }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to root_url }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :post_id).merge(user_id: current_user.id)
  end

  def get_post
    @post = Post.find(params[:post_id])
  end

end
