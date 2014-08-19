class LikesController < AuthenticatedController

  # respond_to :html, :json, :js

  def create
    @like = Like.create(like_params)
    respond_to do |format|
      if @like.save
        # format.js   { render 'records/create.js.erb' }
        format.html { redirect_to root_url }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { redirect_to root_url }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end


  private

  def like_params
    params.permit(:likeable_type, :likeable_id).merge(user_id: current_user.id)
  end


end
