class SessionsController < ApplicationController

	def new
	end

	def create 
		params.inspect
		params[:user][:email] = params[:user][:email].downcase
		params.inspect
		user = User.find_by(email: params[:user][:email])

		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id.to_s
			redirect_to recipes_path
		else
			flash[:danger]= "Invalid login credentials."	
			redirect_to login_path


		end
	end


	def destroy
		session[:user_id]=nil
		redirect_to root_path
	end



end
