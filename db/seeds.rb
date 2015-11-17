# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'ffaker' 

User.destroy_all
City.destroy_all
Post.destroy_all



10.times do 

	# build the user params
	user_params = Hash.new
	 user_params[:first_name] = FFaker::Name.first_name
	 user_params[:last_name] = FFaker::Name.last_name
	 user_params[:location] = FFaker::Address.city
	 user_params[:image_url] = "https://www.drupal.org/files/profile_default.jpg"
	 user_params[:email] = FFaker::Internet.email
	 user_params[:password]  = "123456"
	 # save the user
	 new_user = User.create(user_params)



	# seeds for posts
	5.times do

	  new_post = Post.new
	  new_post.title = FFaker::Movie.title
	  new_post.content = FFaker::Lorem.paragraph
	  
	  new_post.city_id = rand(1..4)
	  new_post.save
	  new_user.posts.push new_post
	end


end

cities = City.create([{ name: 'San Francisco', image: 'http://static3.businessinsider.com/image/51d31170eab8ea101b000001/san-francisco-is-americas-snobbiest-city-according-to-the-rest-of-the-country.jpg' }, { name: 'Seattle', image: 'http://assets3.thrillist.com/v1/image/1528432/size/tl-horizontal_main/20-actually-great-seattle-dates-under-20' }, {name: 'Portland', image: 'https://images.trvl-media.com/media/content/shared/images/travelguides/destination/178299/Portland-20917.jpg'}, {name: 'San Diego', image: 'http://i.kinja-img.com/gawker-media/image/upload/xf78kwfbb9ze3qrxo9to.bmp'}])







