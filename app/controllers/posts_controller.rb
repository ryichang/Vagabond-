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
    @post = Post.find_by_id(params[:id])
    @user = User.find_by_id(@post.user_id)
    render :show
    p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! PostsController#{params[:id]}"
  end

  def destroy
  end
  

end