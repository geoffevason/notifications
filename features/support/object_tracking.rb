
# features/support/paths.rb
module ObjectTracking
  def user_for_user_ref(user_ref)
    @users_hash ||= {}
    if @users_hash[user_ref] == nil
      create_user_with_user_ref(user_ref)
    end
    @users_hash[user_ref]
  end

  def create_user_with_user_ref(user_ref)
    @users_hash ||= {}
    user = FactoryGirl.create(:user, name: user_ref)
    @users_hash[user_ref] = user
  end

  def load_or_create_post
    @post ||= FactoryGirl.create(:post, user: @current_user)
  end
end

World(ObjectTracking)

