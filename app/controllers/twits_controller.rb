class TwitsController < ApplicationController

  def new
    @twit = Twit.new
  end

  def create
    @twit = Twit.new params.require(:twit).permit(:body, :twit_id)
    @twit.user = @current_user
    if @twit.save
      redirect_to root_path
    else
      render :new
    end
  end

end
