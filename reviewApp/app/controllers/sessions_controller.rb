class SessionsController < ApplicationController
  def index
  	redirect_to static_pages_home_path
  end

  def new
  end

  def create
  	#retrieves the registered user with given username
  	user=User.find_by_email(params[:email])
  	#authenticates using password of user and creates a session
  	if user && user.authenticate(params[:password])
  		session[:user_id]=user.id
  		redirect_to root_path, notice: "Welcome #{user.userid}, you are now logged in."

  		#If no matching username and password, redirect to login page and display error message
  	else
  		render 'new', notice: "Invalid Username and/or password"

  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path, notice:"You have successfully logged out!"
  end
end
