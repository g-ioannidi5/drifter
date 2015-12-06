class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
      def show
	    
	  @user2 = User.where("username = ?", params[:username]).first
	  @posts = Post.where("user_id = ?", @user2.id).paginate(:page => params[:posts_page], :per_page => 1)
	  @photos = Post.where("user_id = ? AND attachment != ?", @user2.id, "").paginate(:page => params[:photos_page], :per_page => 1)
  	  end
  	  
  	  def users
	  	  
	  @user3 = User.where("username = ?", params[:search]).first
	  end

	  def findFriends
		 
 	  @users = User.all
	  end
   protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :remember_me, :avatar, :avatar_cache, :name, :email, :date_of_birth) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :current_password, :avatar, :avatar_cache, :name, :email, :date_of_birth) }
  end
  
  def home
    @post = Post.new
  end


  def editProfile

  end
  

end