class Round < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :deck
  belongs_to :user
  has_many :guesses

  def guesses
    Guess.where(round_id: self.id)
  end

  def self.most_recent_round_by_user_and_deck(user_id, deck_id)
    self.where(:user_id => user_id, :deck_id => deck_id).order("updated_at DESC").first
  end

  def percent_correct
    (self.guesses.find_all_by_is_correct(1).size).to_f / (self.guesses.size)
  end

 # def each_users_

end
