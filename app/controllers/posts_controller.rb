class PostsController < ApplicationController
  def new
    @post = Post.new
    render :new
  end

  def create
    post_params = params.require(:post).permit(:title, :content)
    @post = Post.create(post_params)
    redirect_to @post # <-- go to post
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(current_user)
    render :show
  end

  def edit
    @post = Post.find(params[:id])
    @user = User.find(current_user)
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    post_params = params.require(:post).permit(:title, :content)
    @post.update_attributes(post_params)
    redirect_to @post
  end

  def destroy
    @user = User.find(current_user)
    Post.destroy(params[:id])
    redirect_to @user
  end
  

end