class CommentsController < ApplicationController
  
  before_action :require_login, only: [:create, :update, :delete] 

  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.post = post
    if comment.save
      render json: {message: "comment has created"}
    else
      render json: {message: comment.errors.messages}
    end
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(comment_params)
      render json: {comment: CommentSerializer.new(comment), message: "comment has updated"}
    else
      render json: {errors: comment.errors.messages}
    end
  end

  def delete
    comment = Comment.find(params[:id])
    if comment.destroy
      render json: {message: "post has deleted"}
    else
      render json: {errors: post.errors.messages}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
