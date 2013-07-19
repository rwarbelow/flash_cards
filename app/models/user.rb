class User < ActiveRecord::Base
  validates :full_name, :presence => true
  validates :email, :presence => true
  validates :password_hash, :presence => true
  validates_format_of :email, :with => /[A-Z0-9._%\-]+@(?:[A-Z0-9\-]+\.)+[A-Z]{2,4}/i, :on => :create, :message => 'email format not valid'
  has_many :rounds

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user && user.password == password
      user
    else
      nil
    end
  end
end
