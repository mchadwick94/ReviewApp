class PasswordResetsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by_email(params[:email])
		@user.send_password_reset 
		if @user
		redirect_to root_url, :notice => "Reset email sent"
	end
end

	def edit
	end

end
