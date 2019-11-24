class Traveller < ApplicationRecord
	has_secure_password

	validates :trav_email, presence: true, uniqueness: true
	validates :trav_email, format: { with: URI::MailTo::EMAIL_REGEXP }
	validates :password,
		length: { minimum: 6 },
		if: -> { new_record? || !password.nil? }
end
