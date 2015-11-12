# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'ffaker' 

User.destroy_all

5.times do 

	# build the user params
	user_params = Hash.new
	 user_params[:first_name] = FFaker::Name.first_name
	 user_params[:last_name] = FFaker::Name.last_name
	 user_params[:location] = FFaker::Address.city
	 user_params[:email] = FFaker::Internet.email
	 user_params[:password]  = "123456"
	 # save the user
	 new_user = User.create(user_params)

end