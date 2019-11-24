class Setting < ApplicationRecord
	mount_uploader :logo, ImageUploader
	mount_uploader :favicon, ImageUploader
	mount_uploader :banner_activity, ImageUploader
  mount_uploader :banner_destination, ImageUploader
  mount_uploader :banner_catatan, ImageUploader
  mount_uploader :banner_contact, ImageUploader
  mount_uploader :banner_about, ImageUploader
  mount_uploader :photo_about, ImageUploader
  mount_uploader :banner_faq, ImageUploader
  mount_uploader :banner_team, ImageUploader
  mount_uploader :banner_payment, ImageUploader
  mount_uploader :banner_payment_success, ImageUploader
  mount_uploader :banner_payment_pending, ImageUploader
  mount_uploader :banner_login, ImageUploader
  mount_uploader :banner_register, ImageUploader
  mount_uploader :banner_forget_password, ImageUploader
  mount_uploader :banner_reset_password, ImageUploader
  mount_uploader :banner_reset_password_success, ImageUploader
  mount_uploader :banner_verify_register, ImageUploader
end
