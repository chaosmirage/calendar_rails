class Event < ActiveRecord::Base
  validates :title, :date, :type_repeat, presence: true

  belongs_to :user
end
