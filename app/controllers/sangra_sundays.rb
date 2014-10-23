get '/sangria_sundays' do
  @upcoming_sundays = SangriaSunday.upcoming
  @past_sundays = SangriaSunday.past
  # p @result.public_methods
  erb :'/sundays/sundays'
end

post '/sangria_sundays' do
  # client side sunday validation
  if Time.parse(params[:date]).wday == 0
    sangria_sunday = SangriaSunday.create(location: params[:location], date: params[:date])
    sangria_sunday.attendances << Attendance.create(user: current_user, is_host: true)
  else
    session[:messages] = {message: ["That is not a Sunday bro."]}
  end
    redirect '/sangria_sundays'
end

get '/sangria_sundays/:id' do
  @sunday = SangriaSunday.find(params[:id])
  erb(:'/sundays/_show_sunday', :layout => false)
end


# This seems not so RESTful...
get '/sangria_sundays/:id/attend' do
  @sunday = SangriaSunday.find(params[:id])
  erb(:'/sundays/_attend_sunday', :layout => false)
end

post '/sangria_sundays/:id/attend' do
  sunday = SangriaSunday.find(params[:id])
  Attendance.create(user: current_user, sangria_sunday: sunday)
  session[:messages] = {message: ["Welcome to the party!"]}
  # erb(:'/sundays/_attend_sunday', :layout => false)
  redirect '/sangria_sundays'
end
