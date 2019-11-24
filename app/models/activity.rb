class Activity < ApplicationRecord
	mount_uploader :photo, ImageUploader # Tells rails to use this uploader for this model.   
	mount_uploader :banner_photo, ImageUploader # Tells rails to use this uploader for this model.   
	validates :name, presence: true # Make sure the owner's name is present.   
end
