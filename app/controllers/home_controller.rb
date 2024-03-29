class HomeController < ApplicationController

  def index
    @user = User.new

    if logged_user?
      redirect_to "/#{current_user.username}"
    end
  end


  private

    def logged_user?
      container = session || cookies

      if container[:user]
        @user = current_user
      end
    end


end
