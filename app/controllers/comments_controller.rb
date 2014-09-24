class CommentsController < ApplicationController
  before_action :load_post

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to post_url(@post)
    else
      flash.alert = "There are some errors in your new comment, please check them and try again."
      render "posts/show"
    end
  end

  private
  def load_post
    @post = Post.published.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:author, :content)
  end
end
