class Event < ActiveRecord::Base
  belongs_to :user

  validates :title, :date, :type_repeat, presence: true

end
