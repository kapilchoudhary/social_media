class PostsController < ApplicationController
  before_action :require_login, only: [:create, :update, :delete] 

  def index
    all_posts = Post.paginate(page: params[:page])
    render json: {posts: all_posts.map {|post| PostSerializer.new(post)}}
  end 

  def create
    post = Post.new(post_params)
    post.user = current_user
    if post.save
      render json: {message: "post has created"}
    else
      render json: {message: post.errors.messages}
    end
  end

  def update
    post = Post.find(params[:id])
    
    if post.update(post_params)
      render json: {post: PostSerializer.new(post), message: "post has updated"}
    else
      render json: {errors: post.errors.messages}
    end
  end

  def delete
    post = Post.find(params[:id])
    if post.destroy
      render json: {message: "post has deleted"}
    else
      render json: {errors: post.errors.messages}
    end
  end

  def post_params 
    params.require(:post).permit(:title, :description, :image)
  end
end
