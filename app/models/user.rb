class User < ActiveRecord::Base
  validates :full_name, :presence => true
  validates :email, :presence => true
  validates :password_hash, :presence => true
  validates_format_of :email, :with => /[A-Z0-9._%\-]+@(?:[A-Z0-9\-]+\.)+[A-Z]{2,4}/i, :on => :create, :message => 'email format not valid'
  has_many :rounds
  has_many :decks, through: :rounds
  

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

  def rounds_played
    @rounds_played = Round.find_all_by_user_id(self.id)
  end

  def decks_played
    @decks_played = User.find(self.id).rounds.map(&:deck).map(&:title).uniq
  end

end

# To add a deck to a user's decks:
# user.decks << Deck.find(2)
