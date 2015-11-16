class User < ActiveRecord::Base
	has_secure_password
	validates :email, uniqueness: true

  has_many :posts
  has_many :citys, through: :posts

  user = User.new
  user.valid? 
  user.errors[:email]
  user.errors.full_messages

  user.errors.clear
  user.errors.empty? 
  # def a_method_used_for_validation_purposes
  # 	errors.add(:email, "Email is already taken!")
  # end
end
