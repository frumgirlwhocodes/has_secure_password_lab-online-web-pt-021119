class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end
	def new 
	  @user=User.new
	  
	end 
	 def create
   @user= User.new(user_params)
   if @user.save 
     session[:user_id]
     
  end
 
  private
 
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end