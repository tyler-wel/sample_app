# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
test_user = User.create(name: "Tester",
  email: "email@gmail.com",
  password: "foobar",
  password_confirmation: "foobar",
  admin: true)

work_board = test_user.boards.create( { name: "Work Board", description: "All tasks related to work" } )
personal_board = test_user.boards.create( { name: "Person Board", description: "All my personal tasks."})

task_list = work_board.task_lists.create({name:"i'm a list"})

boi_user = User.create(name: "Boi",
  email: "email2@gmail.com",
  password: "foobar",
  password_confirmation: "foobar")

User.create!(name:  "Example User",
  email: "example@railstutorial.org",
  password:              "foobar",
  password_confirmation: "foobar")
  
work_board.users << boi_user



users = User.order(:created_at).take(6)
10.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create(content: content)}
end

