class ProfilesController < ApplicationController
before_action :login_required

	def new
		@profile = current_user.build_profile
	end

	def show
		@profile = Profile.where(:user_id => params[:id]).first
	end

	def create
		@profile = current_user.build_profile(profile_params)
		if @profile.save
			redirect_to root_path
			UserMailer.welcome_email(current_user).deliver_now
		else
			render 'new'
		end
	end

	def update
		@profile = Profile.where(:user_id => params[:id]).first
		if @profile.save(profile_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def edit
		@profile = Profile.where(:user_id => params[:id]).first
	end

	def destroy
	end

	private 
	def profile_params 
		params.require(:profile).permit(:fullName, :dateOfBirth, :address, :cityORtown, :postcode, :country, :user_id, :image)
	end
end
