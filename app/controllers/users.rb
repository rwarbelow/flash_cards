get '/join' do
  erb :create_user
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
