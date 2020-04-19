class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  #Original version
  def create
   @user = User.find(username: params[:username])
  	if @user && @user.authenticate(params[:password])
  		sessions[:user_id] = @user.id
  		redirect_to '/welcome'
  	else
  		redirect_to '/login'
  	end
  end

  # preset version
  # def create
  #   @user = User.find(username: params[:username])
  #   if @user && @user.authenticate(params[:password])
  #     sessions[:user_id] = 1
  #     redirect_to '/welcome'
  #   else
  #     redirect_to '/login'
  #   end
    
  # end

  def login
  end

  def page_requires_login
  end

  def welcome
  end
end
