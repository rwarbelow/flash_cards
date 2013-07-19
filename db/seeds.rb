require "csv"

deck1 = Deck.create(title: "State Capitals", description: "Test your knowledge of US states and their capital cities!")

CSV.foreach('state_capitals.txt') do |row|
  Card.create(question: row[0], answer: row[1], deck_id: deck1.id)
end



deck2 = Deck.create(title: "GRE Vocabulary", description: "Applying for grad school? Use these cards to brush up on your vocabulary!")

CSV.foreach('gretools.csv') do |row|
  Card.create(question: row[0], answer: row[1], deck_id: deck2.id)
end
