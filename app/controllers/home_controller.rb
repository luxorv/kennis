class HomeController < ApplicationController

  before_action :check_logged_user

  def index
    @users = @user || User.all
  end

  private

    def check_logged_user
      @user = User.find(params[:user_id])
    end
end
