class Post < ActiveRecord::Base
	mount_uploader :attachment, AvatarUploader
	acts_as_votable
    belongs_to :user
	validates_presence_of :content
   validates_processing_of :attachment
   
   include PublicActivity::Model
   tracked owner: Proc.new{ |controller, model| controller.current_user }
   tracked recipient: ->(controller, model) { model && model.user }
end