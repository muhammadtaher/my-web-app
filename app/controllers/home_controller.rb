class HomeController < ApplicationController
	def index
	end
	def login
	end
	def loginResponse
		@user = User.find_by_email(params[:email])
		respond_to do |format|
			if @user && match_password
				session[:user_id] = @user.id
				format.html { redirect_to url_for(:controller => 'users', :action => 'profile'), notice: 'You are logged in.' }
			else
				format.html { redirect_to '/home/login', notice: 'Wrong email and password combination'}
			end
		end
	end
	def logged
	end
	def notLogged
	end
	def log_out
		session[:user_id] = nil
		respond_to do |format|
				format.html { redirect_to home_path, notice: 'You are logged out.' }
		end
	end
	def not_found
	end

	private 
		def match_password
			@user.password == params[:password]
		end
end
