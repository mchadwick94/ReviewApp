class PasswordResetsController < ApplicationController
before_action :get_user, only: [:edit, :update]
before_action :valid_user, only: [:edit, :update]
before_action :check_expiration, only: [:edit, :update]
	
	def edit
		@user = User.find_by_id!(params[:id])
	end
	
	def create
		@user = User.find_by_email(params[:email])
		@user.send_password_reset 

		if @user
		redirect_to root_url, :notice => "Reset email sent"
		end
	end

	def update 
		if params[:user][:password].empty?
			@user.errors.add(:password, "Cant be empty")
			redireict_to edit
		elsif @user.update_attributes(user_params)
			flash[:notice] = "Password has been reset"
			redirect_to root_path
		else
			render 'edit'
		end
	end


	private

	def get_user
		@user = User.find_by_id!(params[:id])
	end

	def valid_user
		unless (@user && @user.present?)
		redirect_to root_path
	end
end
	
	def user_params
		params.require(:user).permit(:password, :password_confirmation)
	end

	def check_expiration
		if @user.password_reset_expired?
			flash[:notice] = "Password reset has expired."
			redirect_to new_password_reset_url
		end
	end

	

	

end
