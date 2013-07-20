class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :cards
  has_many :rounds
  has_many :users, through: :rounds

  def cards
    Card.where(deck_id: self.id)
  end

  def how_many_cards
    cards.length
  end
  

end
