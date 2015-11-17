class User < ActiveRecord::Base
	has_secure_password
	validates :email, uniqueness: true
  validates_length_of :first_name, :allow_blank => false
  validates_length_of :last_name, :allow_blank => false
  validates_length_of :location, :allow_blank => false

  has_many :posts
  has_many :cities, through: :posts

  user = User.new
  user.valid? 
  user.errors[:email]
  user.errors.full_messages

  user.errors.clear
  user.errors.empty? 
  # def a_method_used_for_validation_purposes
  # 	errors.add(:email, "Email is already taken!")
  # end

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end
end
