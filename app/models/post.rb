class Post < ActiveRecord::Base
	mount_uploader :attachment, AvatarUploader
	acts_as_votable
  belongs_to :user
  validates_presence_of :content
  
   validates_processing_of :attachment
   
end