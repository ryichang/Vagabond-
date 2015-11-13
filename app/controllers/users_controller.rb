class UsersController < ApplicationController

	def new
		@user = User.new
		render :new
	end 


	def show
		@user = User.find(params[:id])
		render :show
	end

	def create
  	user_params = params.require(:user).permit(:first_name, :last_name, :location, :email, :password)
  	@user = User.create(user_params)
  	login(@user) # <-- login the user
  	redirect_to @user # <-- go to show
  end


end
