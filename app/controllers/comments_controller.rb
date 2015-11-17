class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    comment_params = params.require(:comment).permit(:content, :post_id)
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def show
    @post = Post.find_by_id(params[:id])
    @comment = Comment.find_by_id(params[@post.comment_id])
  end

end