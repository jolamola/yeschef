class SessionsController < ApplicationController

	def new
	end

	def create 
		user = User.find_by(email: params[:user][:email])

		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id 
			redirect_to recipes_path
		else
			render :new

		end
	end


	def destroy
		session[:user_id]=nil
		redirect_to '/login'
	end



end
