class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  def show

    @user2 = User.where("username = ?", params[:username]).first
    @posts = Post.where("user_id = ?", @user2.id)
    @photos = Post.where("user_id = ? AND attachment != ?", @user2.id, "")
    @activities = PublicActivity::Activity.where("owner_id = ?", @user2.id).order(created_at: :desc).last(10)
  end

  def users
    query = params[:search]
    @user3 = User.where("username LIKE ? OR name LIKE ?", "%#{query}%", "%#{query}%")
  end

  def findFriends
    @users = User.all
  end

  def friends
    @user = current_user
    @friends = Friendship.where("user_id =?", @user.id)
    @friends2 ||= Array.new
    @friends.each do |friend|
      @friends2.push(friend.friend_id)
    end
    @friends3 = User.where(id: @friends2)
  end

  def home
    @user = current_user
    @post = Post.new
    @activities = PublicActivity::Activity.where("owner_id = ?", current_user.id).order(created_at: :desc).last(10)
    @notifications = PublicActivity::Activity.where("recipient_id = ? AND owner_id != ?", current_user.id, current_user.id).order(created_at: :desc).last(10)
    @friends = Friendship.where("user_id =?", @user.id)
    @friends2 ||= Array.new
    @friends.each do |friend|
      @friends2.push(friend.friend_id)
    end
    @friends4 = User.where(id: @friends2).last(9)
    @friends3 = User.where(id: @friends2)
    @posts = PublicActivity::Activity.where(owner_id: @friends3).order(created_at: :desc).paginate(:page => params[:page], :per_page => 2)
  end


    def page_not_found
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :remember_me, :avatar, :avatar_cache, :name, :email, :date_of_birth) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :current_password, :avatar, :avatar_cache, :name, :email, :date_of_birth) }
  end

  def editProfile

  end

end