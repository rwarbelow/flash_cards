get '/rounds/:user_id/:deck_id/:card_id' do
  @user = User.find(params[:user_id])
  @deck = Deck.find_by_id(params[:deck_id])
  @cards = @deck.cards

    @card_id = params[:card_id].to_i
    session[:card_id] = @card_id

  erb :learn

end

post '/rounds' do
  @user_input = params[:user_input]
  session[:card_id] += 1
  new_guess = Guess.create(card_id: session[:card_id], round_id: session[:round_id], user_input: params[:user_input])
  new_guess.answer(@user_input)
  redirect to "/rounds/result/#{new_guess.id}"

  # p session

end

get '/rounds/result/:guess_id' do
  @guess = Guess.find_by_id(params[:guess_id])
  @deck = Deck.find_by_id(session[:deck_id])

  erb :result

end
