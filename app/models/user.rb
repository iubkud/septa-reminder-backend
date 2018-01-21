class User < ApplicationRecord
  has_many :alerts
  
  has_secure_password
  validates :email, presence: true
end
