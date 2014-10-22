get '/sangria_sundays' do
  # @result = api_client.execute(:api_method => calendar_api.events.list,
  #                             :parameters => {'calendarId' => 'tqir6m6tqnm92hp6s7fic8lc1c@group.calendar.google.com'},
  #                             :authorization => user_credentials)

  @sundays = SangriaSunday.all
  # p @result.public_methods
  erb :calendar
end

post '/sangria_sundays' do
  sangria_sunday = SangriaSunday.create(location: params[:location], date: params[:date])
  sangria_sunday.attendances << Attendance.create(user: current_user, is_host: true)
# Add event to the official calendar
#   event = {
#   'summary' => 'Sangria Sunay',
#   'location' => params[:location],
#   'start' => {
#     'dateTime' => params[:date] + 'T10:00:00.000-07:00'
#   },
#   'end' => {
#     'dateTime' => params[:date] +'10:25:00.000-07:00'
#   },
#   # icebox implement, email the entire sangria sunday google listserv
#   # 'attendees' => [
#   #   {
#   #     'email' => 'attendeeEmail'
#   #   },
#     #...
#   # ]
# }

event = {
  'summary' => 'Appointment',
  'location' => 'Somewhere',
  'start' => {
    'dateTime' => '2014-10-03T10:00:00.000-07:00'
  },
  'end' => {
    'dateTime' => '2014-10-03T10:25:00.000-07:00'
  },
  'attendees' => [
    {
      'email' => 'attendeeEmail'
    },
    #...
  ]
}

  result = api_client.execute(:api_method => $service.events.insert,
                          :parameters => {'calendarId' => 'tqir6m6tqnm92hp6s7fic8lc1c@group.calendar.google.com'},
                          :body => JSON.dump(event),
                          :headers => {'Content-Type' => 'application/json',
                          :authorization => user_credentials})
  puts "--"
  print result.response
  # byebug
  puts "--"

  redirect '/sangria_sundays'
end
