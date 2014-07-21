class RegistrationController < ApplicationController

  def new
    @user = User.new
    render 'users/new'
  end

  def create
    @user = User.new
    new_user = RegistrationService.register(user_params)
    redirect_to "/#{new_user.username}"
  end

  private

    def user_params
      params
    end
end
