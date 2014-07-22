class UsersController < ApplicationController
  layout "main"

  def new
    @user = User.new
  end

  def show
    @some_str = "asssss"
    if session[:username] == params[:username]
      @user = User.find_by_username(params[:username])
      @tutos = @user.tutorials
      @badges = @user.badges
      render 'main/index'
    else
      redirect_to '/'
    end
  end

end
