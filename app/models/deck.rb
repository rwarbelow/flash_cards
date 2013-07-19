class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :cards

  def cards
    Card.where(deck_id: self.id)
  end

  def how_many_cards
    cards.length
  end
  

end
