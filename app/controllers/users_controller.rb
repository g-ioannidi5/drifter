class UsersController < ApplicationController
    def show
	  @user2 = User.where("id= ?", params[:id]).first
	  @posts = Post.where("user_id = ?", @user2.id).paginate(:page => params[:page], :per_page => 1)
	  @photos = Post.where("user_id = ? AND attachment != ?", @user2.id, "").paginate(:page => params[:page], :per_page => 1)
  	end
 end