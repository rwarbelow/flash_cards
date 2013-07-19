class Card
	def initialize(question, answer)
		@question = question
		@answer = answer
	end
end


require "csv"
array = []
CSV.foreach('state_capitals.txt') do |row|
  array << Card.new(row[0],row[1])
end


p array