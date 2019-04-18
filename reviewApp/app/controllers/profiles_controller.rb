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
		@profile = Profile.find(params[:id])
		if @profile.update(profile_params)
			redirect_to @profile
		else
			render 'edit'
		end
	end

	def edit
		@profile = Profile.find(params[:id])
	end

	def destroy
	end

	private 
	def profile_params 
		params.require(:profile).permit(:fullName, :dateOfBirth, :address, :cityORtown, :postcode, :country, :photoOfUser, :userid)
	end
end
