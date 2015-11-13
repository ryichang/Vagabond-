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
    # @user = User.find(params[:id])
    render :show
  end

  def destroy
  end
  

end