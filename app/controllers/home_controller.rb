class HomeController < ApplicationController

  before_action :authenticate_user!
  
  def timeline
  end
end
