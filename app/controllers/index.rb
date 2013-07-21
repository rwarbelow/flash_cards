enable :sessions
# we can store @user.id in cookies so it's not in url:
# http://guides.rubyonrails.org/v2.3.11/action_controller_overview.html#cookies

get '/' do
  erb :index
end

get '/decks/:user_id' do
  @user = User.find(params[:user_id])
  @decks = Deck.all
  erb :decks
end

get '/decks/:deck_id/:user_id' do
  @deck = Deck.find_by_id(params[:deck_id])
  @user = User.find_by_id(params[:user_id])
  erb :start_page
end

get '/join' do
  erb :create_user
end

get '/join/:user_id' do
  @user = User.find(params[:user_id])
  redirect "/#{@user.id}"
end

post '/create_new_user' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/user_profile/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :create_user
  end
end

get '/user_profile/:user_id' do
  @user = User.find(params[:user_id])
  if @user.id #== current_user.id
    erb :user_profile
  else
    @error = "Page does not exist. Sorry, buddy... :("
    erb :user_profile
  end
end

get '/:user_id' do
  @user = User.find(params[:user_id])
  erb :index
end
