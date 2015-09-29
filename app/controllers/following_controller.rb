class FollowingController <ApplicationController

  before_action :authenticate_user!

  def create
    new_user = User.find params[:id]
    @current_user.follow(new_user)
    redirect_to root_path, notice: "You are now following #{new_user.username}"
  end

  def delete
    new_user = User.find_by params [:id]
    @current_user.stop_following(new_user)
    redirect_to root_path, notice: "You are no longer follwing #{new_user.username}"
  end
end
