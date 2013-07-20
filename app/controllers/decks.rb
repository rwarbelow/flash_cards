get '/decks' do
  @decks = Deck.all
  erb :decks
end

get '/decks/:deck_id/:user_id' do
  @deck = Deck.find_by_id(params[:deck_id])
  @user = User.find_by_id(params[:user_id])
  erb :start_page
end

