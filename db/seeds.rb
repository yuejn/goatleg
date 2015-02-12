# users = [
#   "bruce@wayne.com",
#   "wonder@woman.com",
#   "clark@kent.com",
#   "peter@parker.com",
#   "robin@hood.co.uk",
#   "ned@kelly.com.au",
#   "tony@stark.ceo"
# ]

# users.each do |email|
#   User.create(email: email, password: 'password123', password_confirmation: 'password123')
# end

profiles = [
  [1, 'm', 'f', 32],
  [2, 'f', 'f', 28],
  [3, 'm', 'f', 30],
  [4, 'm', 'f', 16],
  [5, 'm', 'f', 26],
  [6, 'm', 'f', 34],
  [7, 'm', 'm', 35]
]

profiles.each do |a,b,c,d|
  Profile.create(user_id:a, gender:b, seeking_gender:c, age:d)
end