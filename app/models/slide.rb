class Slide < ApplicationRecord
	mount_uploader :photo, ImageUploader # Tells rails to use this uploader for this model.   
end
