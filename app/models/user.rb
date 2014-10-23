class User < ActiveRecord::Base
  include BCrypt
  def self.authenticate(email, given_password)
    user = User.find_by(email: email)
    user.password == given_password ? user : nil
  end

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end


  validates :username, :length => { :minimum => 3, :message => "must be at least 3 characters, fool!" }
  # I'm aware this line below this do nothing. Waiting for rails has_secure_password
  validates :password_digest, :length => { :minimum => 6 }
  validates :email, :uniqueness => true, :format => /.+@.+\..+/


  has_many :attendances
  has_many :dishes, through: :attendances
  has_many :sangria_sundays, through: :attendances

  def hosted
    SangriaSunday.all.select {|sunday| sunday.host == self }
  end
end
