class User < ActiveRecord::Base
  validates :email, :password, presence: true
  validates :name, :last_name, length: {maximum: 50}
  validates :password, length: {minimum: 6}
  has_many :events
  has_secure_password
end
