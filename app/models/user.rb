class User < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	acts_as_voter

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  validates_presence_of   :avatar, :name, :email, :date_of_birth
  validates_integrity_of  :avatar
  validates_processing_of :avatar
  

  # posts
  has_many :posts
  
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user
  
  def friends? other_user
    friend_ids.include? other_user.id
  end
 
  def follow other_user
    friendships.create(friend: other_user)
  end

  def unfollow other_user
    friends.destroy(other_user)
  end
  
   

  
end
