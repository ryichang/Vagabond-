class WelcomeController < ApplicationController
	def index
		@user = User.new
		@cities = City.all
	end
end
