class User < ActiveRecord::Base
	has_many :addeds, dependent: :destroy
	has_many :songs, through: :addeds

	validates :first_name, :last_name, presence: true
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  	validates :password, presence: true, length: { minimum: 8 }
end
