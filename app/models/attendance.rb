class Attendance < ActiveRecord::Base
  # icebox: validation so that there can only be one record that has true for is host
  # validate :is_host

  belongs_to :user
  belongs_to :sangria_sunday
  has_many :dishes
end
