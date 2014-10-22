class SangriaSunday < ActiveRecord::Base
  has_many :attendances
  has_many :users, through: :attendances

  def host
    Attendance.find_by(is_host: true).user
  end
end
