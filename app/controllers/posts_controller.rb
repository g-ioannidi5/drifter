class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :update, :destroy]
  respond_to :html

  def index
    @posts = Post.where("user_id =?", current_user.id)
  end

  def show
    respond_with(@post)
  end

  def create
    @post = Post.new(post_params) do |post|
      post.user = current_user
    end
    if @post.save
		  redirect_to root_path
    else
      redirect_to posts_path, notice: @post.errors.full_messages.first
    end
  end

  def update
	if current_user != @post.user
    	redirect_to root_path
    else
    	@post.update(post_params)
		respond_with(@post)
    end
  end

  def destroy
	if current_user != @post.user
    	redirect_to root_path
    else
    	@post.destroy
		respond_with(@post)
    end
  end
  
  def upvote
  	@post = Post.find(params[:id])
  	@user = User.find(@post.user_id)
  	@post.liked_by current_user
  	@post.create_activity :upvote, owner: current_user, recipient: @user
  	redirect_to :back
  end

  def unvote_up
	@post = Post.find(params[:id])
	@user = User.find(@post.user_id)
	@post.unliked_by current_user
	@post.create_activity :unvote_up, owner: current_user, recipient: @user
	redirect_to :back
  end

  def downvote
  	@post = Post.find(params[:id])
  	@user = User.find(@post.user_id)
  	@post.downvote_from current_user
  	@post.create_activity :downvote, owner: current_user, recipient: @user
  	redirect_to :back
  end

  def unvote_down
	@post = Post.find(params[:id])
	@user = User.find(@post.user_id)
	@post.undisliked_by current_user
	@post.create_activity :unvote_down, owner: current_user, recipient: @user
	redirect_to :back
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :attachment)
  end
end