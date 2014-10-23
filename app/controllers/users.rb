get '/users' do
  @users = User.all
  erb :'users/user_index'
end

get '/users/:id' do
  @user = User.find(params[:id])

  erb :'/users/user_show'
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'/users/user_edit'
end

patch '/users' do
  # This currently isn't working with password because it will overwrite existing password.
  if current_user.update(params[:args])
    session[:messages] = {message: ["Update Succesful"]}
    redirect "/users/#{current_user.id}"
  else
    errors = current_user.errors.messages
    session[:messages] = errors
  end
end

get '/users/:id/confirm_delete' do

  erb :'/users/user_confirm_delete'
end

delete '/users' do
  session.clear
  session[:messages] = {message: ["Sorry to see you leave. Keep the dream alive. Have fun at the roadhouse"]}
  redirect '/'
end
