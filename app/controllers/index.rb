get '/' do
  erb :index
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user
    # if User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
    #   redirect '/'
    # else
    #   session[:messages] = {message: ["Login failed invalid password"]}
      redirect '/'
    # end
  else
    session[:messages] = {message: ["Login failed invalid email"]}
    redirect '/'
  end
end

get '/logout' do
  session.clear
  session[:messages] = {message: ["Later...See you at the diner."]}
  erb :index
end

get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.new(params[:args])
  if user.valid?
    session[:messages] = {message: ["Welcome to Sangria Sunday. Sign In."]}
    user.save
    redirect '/'
  else
    session[:messages] = user.errors.messages
    redirect '/signup'
  end
end

