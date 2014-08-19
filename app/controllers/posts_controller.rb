class PostsController < AuthenticatedController

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        # format.js   { render 'records/create.js.erb' }
        format.html { redirect_to root_url }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to root_url }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def post_params
    params.require(:post).permit(:content).merge(user_id: current_user.id)
  end

end
