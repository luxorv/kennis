class UsersController < ApplicationController
  layout "main"

  def new
    @user = User.new
  end

  def show
    if session[:username] == params[:username]
      render 'main/index'
    else
      redirect_to '/'
    end
  end

end
