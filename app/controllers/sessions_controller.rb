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

    if user
      session[:user] = user
      cookies[:user] = user
      redirect_to root_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
