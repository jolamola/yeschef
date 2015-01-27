class UsersController < ApplicationController

	def index
		# @user = User.new
	end

	def new
		@user = User.new
	end

	def create
		# params[:email] = params[:email].downcase

		@user = User.new(user_params)

		if @user.save
			redirect_to '/login'
		else
			render :new
		end
	end

	private

	def user_params
		# params[:email] = params[:email].downcase
		params.require(:user).permit(
			:firstname, :lastname, :email, :password, :password_confirmation)
	end

end
