# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'ffaker' 

User.destroy_all


10.times do 

	# build the user params
	user_params = Hash.new
	 user_params[:first_name] = FFaker::Name.first_name
	 user_params[:last_name] = FFaker::Name.last_name
	 user_params[:location] = FFaker::Address.city
	 user_params[:email] = FFaker::Internet.email
	 user_params[:password]  = "123456"
	 # save the user
	 new_user = User.create(user_params)



	# seeds for posts
	5.times do

	  new_post = Post.new
	  new_post.title = FFaker::Movie.title
	  new_post.content = FFaker::Lorem.paragraph
	  
	  new_post.city_id = 1 + rand(30)
	  new_post.save
	  new_user.posts.push new_post
	end


end

# seeds for citys
# 5.times do
#   city_params= Hash.new
#   city_params[:name] = FFaker::Address.city
#   city_params[:image] = FFaker::Avatar.image
# end