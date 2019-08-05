class SessionsController < ApplicationController
  
  def login 
    render "sessions/login"
  end 
  def create 
    @user=User.find_by(name: params[:user][:name])
	  if @user && @user.authenticate(params[:user][:password])
	    session[:user_id]=@user.id 
	    redirect_to user_path(@user)
	  else 
	    flash[:error]="User not found or wrong password, login again"
			render 'sessions/login'
	   
  end
  end 
  
  
end 