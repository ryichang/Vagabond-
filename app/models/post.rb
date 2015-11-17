class Post < ActiveRecord::Base
  validates_length_of :title, :minimum => 1, :maximum => 200
  validates_length_of :content, :allow_blank => false
  
  post = Post.new
  post.valid?
  post.errors[:title]
  post.errors.full_messages

  belongs_to :user
  belongs_to :city

  has_many :comments
end
