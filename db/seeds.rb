# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
test_user = User.create!(name: "Tester",
  email: "email@gmail.com",
  password: "foobar",
  password_confirmation: "foobar",
  admin: true)


boi_user = User.create!(name: "Boi",
  email: "email2@gmail.com",
  password: "foobar",
  password_confirmation: "foobar")


work_board = test_user.boards.create!( { name: "Work Board", 
            description: "All tasks related to work", user_id: test_user.id } )
personal_board = test_user.boards.create!( { name: "Person Board", 
            description: "All my personal tasks.", user_id: boi_user.id})

front_list = work_board.task_lists.create!({name:"Front-End Tasks"})
back_list = work_board.task_lists.create!({name:"Back-End Tasks"})
data_list = work_board.task_lists.create!({name:"Database ToDo"})



work_board.users << boi_user


User.create!(name:  "Example User",
  email: "example@railstutorial.org",
  password:              "foobar",
  password_confirmation: "foobar")
  

3.times do
  front_name = Faker::Games::Pokemon.name
  back_name = Faker::Games::Pokemon.name
  description = Faker::Lorem.sentence(5)
  front_list.tasks.create!({name: front_name, description: description, user_id: test_user.id})
  back_list.tasks.create!({name: front_name, description: description, user_id: boi_user.id})
end

name1 = Faker::Games::Pokemon.name
name2 = Faker::Games::Pokemon.name
description = Faker::Lorem.sentence(10)
data_list.tasks.create!({name: name1, description: description, user_id: test_user.id})
data_list.tasks.create!({name: name2, description: description, user_id: boi_user.id})


users = User.order(:created_at).take(3)
10.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create(content: content)}
end

