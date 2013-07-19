require "csv"

deck1 = Deck.create(title: "State Capitals", description: "Test your knowledge of US states and their capital cities!")
array = []
CSV.foreach('state_capitals.txt') do |row|
  array << Card.create(question: row[0], answer: row[1], deck_id: deck1.id)
end



deck2 = Deck.create(title: "GRE Vocabulary", description: "Applying for grad school? Use these cards to brush up on your vocabulary!")
array = []
CSV.foreach('gretools.csv') do |row|
  array << Card.create(question: row[0], answer: row[1], deck_id: deck2.id)
end
