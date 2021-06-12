puts 'Start inserting seed "users" ...'
3.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password'
    )
  puts "\"#{user.email}\" has created!"
end