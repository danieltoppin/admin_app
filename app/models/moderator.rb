class Moderator < ApplicationRecord
	has_secure_password

	has_many :posts

	validates :fullname, presence: true
	validates :username, presence: true
	validates :password, presence: true
end
