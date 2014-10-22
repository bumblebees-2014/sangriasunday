require 'faker'
# users
andres = User.create(username: "arpsito")
thomas = User.create(username: "tsabend")
richard = User.create(username: "lynx")
# attendances
andres_hosting = Attendance.create(sangria_sunday_id: 1, user_id: 1, is_host: true)
thomas_going = Attendance.create(sangria_sunday_id: 1, user_id: 2)
rich_going = Attendance.create(sangria_sunday_id: 1, user_id: 3)
# sundays
next_sunday = SangriaSunday.create(location: "Spotty Palace", date: "10/26/2014")
sunday_after = SangriaSunday.create(location: "Rich's Apartment", date: "11/2/2014")
# dishes
apple_gria = Dish.create(title: "Apple 'Gria", recipe: "1x jug of Rossi, 3x apples, 2x cups of brandy, 1x quart apple cider. Directions: cut up apples, rossi it up. enjoy on ice", course: "Sangria", attendance_id: 1)
chili = Dish.create(title: "Chili", recipe: "put stuff in pot", attendance_id: 2)









# def attendance_factory(user, sunday)
#   sunday.attendances << user
# end
