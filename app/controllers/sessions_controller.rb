class SessionsController < ApplicationController

  EMAIL_REGEX = /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/

  #instance methods

  def new
  end

  def create

    email = ''
    username = ''

    if params[:login_id] =~ EMAIL_REGEX
      email = params[:login_id]
    else
      username = params[:login_id]
    end

    user = User.authenticate(
      username,
      email,
      params[:password]
    )

    logger.debug "#### USER LOGIN #{params.to_s} ####"

    if user
      session[:username] = user.username
      cookies[:user] = user

      redirect_to "/#{user.username}"
    else
      flash.now.alert = "Invalid email or password"
      redirect_to "/"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
