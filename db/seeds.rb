require 'faker'
# users
andres = User.create(username: "arpsito", email: "andres@gmail.com", password_digest: "groovy")
thomas = User.create(username: "tsabend", email:"tsabend@gmail.com", password_digest: "blahbal")
richard = User.create(username: "lynx", email: "richand@gmail.com", password_digest: "ghghghghgh")
# attendances
andres_hosting = Attendance.create(sangria_sunday_id: 1, user_id: 1, is_host: true)
thomas_going = Attendance.create(sangria_sunday_id: 1, user_id: 2)
rich_going = Attendance.create(sangria_sunday_id: 1, user_id: 3)

andres_going2 = Attendance.create(sangria_sunday_id: 2, user_id: 1)
thomas_going2 = Attendance.create(sangria_sunday_id: 2, user_id: 2)
rich_hosting2 = Attendance.create(sangria_sunday_id: 2, user_id: 3, is_host: true)


# sundays
last_sunday = SangriaSunday.create(location: "Spotty Palace", date: "2014/10/19")
next_after = SangriaSunday.create(location: "Rich's Apartment", date: "2014/11/2")
# dishes
apple_gria = Dish.create(title: "Apple 'Gria", recipe: "1x jug of Rossi, 3x apples, 2x cups of brandy, 1x quart apple cider. Directions: cut up apples, rossi it up. enjoy on ice", course: "Sangria", attendance_id: 1)
chili = Dish.create(title: "Chili", recipe: "put stuff in pot", attendance_id: 2)

