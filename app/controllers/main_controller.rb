class MainController < ApplicationController
  layout "main"

  def index

    @user = User.new

    if !logged_user?
      redirect_to '/'
    end
  end

  def profile
  end


  private

    def logged_user?
      container = session || cookies

      if container[:user]
        @user = current_user
      end
    end

end
