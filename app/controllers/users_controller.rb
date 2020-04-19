class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
  	@user = User.new
  	
  end

  #preset username and password
 #  def create
 #  	username_html = params[:username].strip
 #  	password_html = params[:password].strip

 #  	@user = User.create(params.require(:user).permit(:username, :password))
 #  	@user.username = "test"
 #  	@user.password = "123"

 #  	if @user.username.to_s == username_html && @user.password.to_s == password_html
 #  		session[:user_id] = @user.id
 #  		flash.notice = "Aunthenticated!"
 #  		redirect_to '/welcome'
	# else
	# 	flash.notice = "Contact with admin for authentication!"
	# 	redirect_to '/login'

 #  	#redirect_to '/welcome'
 #  end

  # original version
  def create
  	@user = User.create(params.require(:user).permit(:username, :password))
  	session[:user_id] = @user.id

  	redirect_to '/welcome'
  end
end
