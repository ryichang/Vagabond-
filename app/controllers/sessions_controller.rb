class SessionsController < ApplicationController

	def new
		@user = User.new
		render :new
	end

	 def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      redirect_to @user
    else
      redirect_to new_session_path
    end
  end
  
end
