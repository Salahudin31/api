class DalamNegeri < ApplicationRecord
	mount_uploader :photo, ImageUploader # Tells rails to use this uploader for this model.   
	mount_uploader :banner_photo, ImageUploader # Tells rails to use this uploader for this model.   
end
