enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/decks' do
  @decks = Deck.all
  erb :decks
end
