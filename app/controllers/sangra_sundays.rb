get '/sangria_sundays' do
  @upcoming_sundays = SangriaSunday.upcoming
  @past_sundays = SangriaSunday.past
  # p @result.public_methods
  erb :'/sundays/sundays'
end

post '/sangria_sundays' do
  # client side sunday validation
<<<<<<< HEAD

=======
>>>>>>> cb7a4d6a4c019f4cb0b88ffac7209ca6a71c358a
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


# AJAJAJAJAJAJAJAJX routes

# They seems not so RESTful...
get '/sangria_sundays/:id/attend' do
  @sunday = SangriaSunday.find(params[:id])
  erb(:'/sundays/_attend_sunday', :layout => false)
end

post '/sangria_sundays/:id/attend' do
  @sunday = SangriaSunday.find(params[:id])
  Attendance.create(user: current_user, sangria_sunday: @sunday)
  session[:messages] = {message: ["Welcome to the party!"]}
  erb(:'/sundays/_attend_sunday', :layout => false)
end

# Can't namespace a delete route in ajax...can I?
post '/sangria_sundays/:id/leave' do
  @sunday = SangriaSunday.find(params[:id])
  attendance = Attendance.find_by(user: current_user, sangria_sunday: @sunday)
  attendance.delete
  session[:messages] = {message: ["Aw..."]}
  erb(:'/sundays/_attend_sunday', :layout => false)
end

post '/sangria_sundays/:id/bring' do
  @sunday = SangriaSunday.find(params[:id])
  attendance = Attendance.find_by(user: current_user, sangria_sunday: @sunday)
  byebug
  dish = Dish.create(params[:data])
  attendance.dishes << dish
  session[:messages] = {message: ["Can't wait to try the " + dish.title]}
  erb(:'/sundays/_attend_sunday', :layout => false)
end
