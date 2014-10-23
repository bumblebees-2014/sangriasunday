class SangriaSunday < ActiveRecord::Base
  has_many :attendances
  has_many :users, through: :attendances

  def host
    Attendance.where(sangria_sunday: self, is_host: true).first.user
  end

  def self.upcoming
    upcoming = SangriaSunday.all.select {|sunday| sunday.date > Time.now }
    upcoming.sort_by { |sunday| sunday.date}.reverse
  end

  def self.past
    past = SangriaSunday.all.select {|sunday| sunday.date < Time.now }
    past.sort_by { |sunday| sunday.date}.reverse
  end
end
