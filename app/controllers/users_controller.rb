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
     session[:user_id]=@user.id 
     redirect_to user_path(@user)
   else 
  render 'sessions/login'
  end
end 
 
  private
 
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end