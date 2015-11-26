class User < ActiveRecord::Base
  validates :email, :password, presence: true
  validates :name, :last_name, length: { maximum: 50}

  has_many :events
end
