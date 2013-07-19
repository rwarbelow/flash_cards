get '/join' do
  erb :create_user
end



post '/create_new_user' do
  @user = User.new(params[:user])

  if @user.save
    redirect "/user_profile/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :create_user
  end
end



get '/user_profile/:id' do
  @user = User.find(params[:id])
  
  erb :user_profile

end
