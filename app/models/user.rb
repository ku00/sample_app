class User < ActiveRecord::Base
  has_secure_password

  validates :name,
    presence: true,
    length: { maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email,
   presence: true,
   length: { maximum: 255 },
   format: { with: VALID_EMAIL_REGEX },
   uniqueness: { case_sensitive: false }

  validates :password,
    presence: true,
    length: { minimum: 6 }

  before_save { email.downcase! }
end
