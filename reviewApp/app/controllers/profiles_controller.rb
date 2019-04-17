class ProfilesController < ApplicationController

	def new
		@profile = Profile.new
	end

	def show
		@profile = Profile.find(params[:id])
	end

	def index
		@profiles = Profile.all
	end

	def create
		@profile = Profile.new(profile_params)
		if @profile.save
			redirect_to @profile
		else
			render 'new'
		end
	end

	def update
	end

	def edit
	end

	def destroy
	end

	private 
	def profile_params 
		params.require(:profile).permit(:fullName, :dateOfBirth, :email, :address, :cityORtown, :country, :photoOfUser)
	end
end
