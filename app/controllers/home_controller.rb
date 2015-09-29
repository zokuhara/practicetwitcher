class HomeController < ApplicationController

  before_action :authenticate_user!

  def timeline
    @users = User.where("id != ?", @current_user.id)
  end
end
