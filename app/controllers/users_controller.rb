class UsersController < ApplicationController

	def index
	end

	# new user method
	def new
		@user = User.new
	end

	# creates new user, then redirects to login page
	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to '/'
		else
			render :new
		end
	end

	private

	#params to create new user
	def user_params
		params.require(:user).permit(
			:firstname, :lastname, :email, :password, :password_confirmation)
	end

end
