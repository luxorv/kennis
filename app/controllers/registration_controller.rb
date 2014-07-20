class RegistrationController < ApplicationController

  def new
    @user = User.new
    render 'users/new'
  end

  def create
    user = RegistrationService.register(user_params)
    redirect_to root_url(user)
  end

  private

    def user_params
      params.require(:user).permit(
        :name,
        :username,
        :email,
        :password,
        :password_confirmation
      )
    end
end
