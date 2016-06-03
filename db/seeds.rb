require 'faker'

5.times do
  user = User.new(
    username: Faker::Name.first_name,
    password: Faker::Internet.password(8)
  )
  user.save!
end
users = User.all

10.times do
  list = List.new(
    name: Faker::Hacker.verb,
    permissions: 'open',
    user: users.sample
  )
  list.save!
end
lists = List.all

20.times do
  item = Item.new(
    description: Faker::Hacker.say_something_smart,
    completed: false,
    list: lists.sample
  )
  item.save
end


puts "Seeding Finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"
