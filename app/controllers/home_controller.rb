class HomeController < ApplicationController

  def index
    if logged_user?
      @users = User.all
    else
      render new_session_path
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
