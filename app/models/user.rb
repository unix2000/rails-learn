class User < ApplicationRecord	
	validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	has_many :microposts
	has_secure_password
	# 转换成小写
	before_save { self.email = email.downcase }
	before_create :generate_authentication_token
	def generate_authentication_token
		loop do
			self.authentication_token = SecureRandom.base64(64)
			break if !User.find_by(authentication_token: authentication_token)
		end
	end

	def reset_auth_token!
		generate_authentication_token
		save
	end
end
