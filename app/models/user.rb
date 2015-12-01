class User < ActiveRecord::Base
  has_many :events
  has_secure_password

  validates :email, :password, presence: true
  validates :name, :last_name, length: {maximum: 50}
  validates :password, length: {minimum: 6}

end
