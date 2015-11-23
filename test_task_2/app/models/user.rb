class User < ActiveRecord::Base
  validates :email, :password, presence: true

  has_many :events
end