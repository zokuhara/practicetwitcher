class HomeController < ApplicationController

  before_action :authenticate_user!


  def timeline
    @users = User.where("id != ?", @current_user.id)
    follower_ids = @current_user.following_users.pluck(:id)
    all_ids = follower_ids << @current_user.id
    @people = Twit.where(user_id: all_ids).order("created_at DESC")
  end
end
