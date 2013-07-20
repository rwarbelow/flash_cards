require "csv"
require "faker"

deck1 = Deck.create(title: "State Capitals", description: "Test your knowledge of US states and their capital cities!")

CSV.foreach('state_capitals.txt') do |row|
  Card.create(question: row[0], answer: row[1], deck_id: deck1.id)
end



deck2 = Deck.create(title: "GRE Vocabulary", description: "Applying for grad school? Use these cards to brush up on your vocabulary!")

CSV.foreach('gretools1.csv') do |row|
  Card.create(question: row[0], answer: row[1], deck_id: deck2.id)
end

100.times do
  Guess.create(card_id: (1..20).to_a.sample, round_id: (1..10).to_a.sample,
                       user_input: Faker::Address.city, is_correct: rand(2))
end

10.times do
  Round.create(user_id: 1, deck_id: deck1.id)
end

User.create(full_name: "Joe", email: "joe@example.com", password_hash: "1234")


# 5.times do
#   Round.create(user_id: 1, deck_id: deck2.id)
# end

