class UsersController < ApplicationController

	def new 
		@user = User.new
	end

	def create
		@user=User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to new_profile_path, notice: 
			"Welcome #{@user.userid}! to Congo. Please set up your profile."
		else
			render 'new'
		end
	end

	def index
		@users = User.all
	end

	private def user_params
		params.require(:user).permit(:userid, :email, :password, :password_confirmation)
	end

end
