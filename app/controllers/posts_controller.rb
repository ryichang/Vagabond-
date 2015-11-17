class PostsController < ApplicationController
  def new
    @post = Post.new
    @cities = City.all
    @user = User.find(current_user)

    render :new
  end

  def create
    post_params = params.require(:post).permit(:title, :content, :user_id, :city_id)
    @post = Post.create(post_params)
    @current_user= current_user
    @cities = City.all
    @post.user_id = @current_user.id
    if @post.save
      redirect_to @post # <-- go to post
    else 
      render :new
    end
   

  end

  def show
    @post = Post.find_by_id(params[:id])
    @user = User.find_by_id(@post.user_id)
    @city = City.find_by_id(@post.city_id)
    @cities = City.all
    render :show
  end

  def edit
    @post = Post.find(params[:id])
    @user = User.find(current_user)
    @cities = City.all
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    post_params = params.require(:post).permit(:title, :content)
    @post.update_attributes(post_params)
    @cities = City.all
    redirect_to @post
  end

  def destroy
    @user = User.find(current_user)
    Post.destroy(params[:id])
    @cities = City.all
    redirect_to @user
  end
  

end