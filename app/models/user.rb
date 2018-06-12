class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :comments

  validates :screen_name, presence: true, length: { maximum: 30 },
                          uniqueness: true

  validates :name, presence: true
                         
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 5 }

end
