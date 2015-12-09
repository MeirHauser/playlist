class Song < ActiveRecord::Base
	has_many :addeds, dependent: :destroy
	has_many :users, through: :addeds

	validates :title, :artist, presence: true
end
