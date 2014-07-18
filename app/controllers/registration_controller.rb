class RegistrationController < ApplicationController

  def new
    @user = User.new
    render 'users/new'
  end

  def create
    user = RegistrationService.register(params[:user])
    redirect_to home_path(user)
  end
end
