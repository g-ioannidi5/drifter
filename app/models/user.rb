class User < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  validates_presence_of   :avatar, :name, :email, :date_of_birth
  validates_integrity_of  :avatar
  validates_processing_of :avatar
end
