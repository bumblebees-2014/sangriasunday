get '/' do
  erb :index
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user
    if User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect '/'
    else
      session[:messages] = {message: ["Login failed invalid password"]}
      redirect '/'
    end
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
  @user = User.new(params[:args])
  if @user.save
    session[:messages] = {message: ["Welcome to Sangria Sunday. Sign In."]}
    redirect '/'
  else
    session[:messages] = user.errors.messages
    redirect '/signup'
  end
end

# GOOOOOGLELGOGLGOGOLGOGOGOGO

get "/auth" do
  # redirect $authorization.auth_code.authorize_url(:redirect_uri => 'http://localhost:9393/callback',:scope => 'https://www.googleapis.com/auth/plus.me',:access_type => "offline")
  # $authorization.fetch_temporary_credential!(:additional_parameters => {
  # :scope => 'https://mail.google.com/mail/feed/atom' })

end

get '/callback' do

#   access_token = CLIENT.auth_code.get_token(params[:code], :redirect_uri => 'http://localhost:9393/callback')
#   # response = access_token.get('https://www.googleapis.com/oauth2/v1/userinfo?alt=json')
#   response = access_token.get('https://www.googleapis.com/oauth2/v1/userinfo?alt=json')
# # https://www.googleapis.com/plus/v1/people/userId
# #   user_info = JSON.parse(response.body)
#     $authorization.fetch_token_credential!(:verifier => '12345')
#     response = client.fetch_protected_resource(
#       :uri => 'https://mail.google.com/mail/feed/atom'
#     )
#    $authorization.code = request.body.read
#    $authorization.fetch_access_token!
#    $client.authorization = $authorization

#   byebug
  # puts user_info
  # @user = User.find_or_create_by(name: user_info["name"])
  # @user.update(email: user_info["email"], picture: user_info["picture"])

  # session[:current_user] = @user.id

  # redirect "/users/#{session[:current_user]}"
end
