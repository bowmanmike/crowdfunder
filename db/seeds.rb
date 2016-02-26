# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(first_name: "Mike", last_name: "Bowman", username: "JohnnyFucktard", email: "msmithros@hotmail.com",
    password: "mike",
            password_confirmation: "mike" )
# User.create(first_name: "Matthew", last_name: "Smith", email: "matthewalexander108@gmail.com", password: "matthew",
#             password_confirmation: "matthew" )
# User.create(first_name: "Steve", last_name: "Oniel", email: "steve@gmail.com", password: "steve",
#             password_confirmation: "steve" )

50.times do
  Project.create(name: Faker::Commerce.product_name, end_date: Time.current, funding_goal: Faker::Commerce.price, description: "This is a serious
  project yo", owner_id: 1)
end
# Project.create(name: "kickstand", end_date: Time.current, funding_goal: 100000, description: "This is a serious
# project yo", owner_id: 2)
# Project.create(name: "crowdfunder", end_date: Time.current, funding_goal: 100000, description: "This is a serious
# project yo", owner_id: 3)

Project.find(1).rewards.create(name: "John Boy", price: 50, number_available: 1, description: "This reward is awesome")
# Project.find(2).rewards.create(name: "John Boy", price: 50, number_available: 1, project_id: 2)
# Project.find(3).rewards.create(name: "John Boy", price: 50, number_available: 1, project_id: 3)

Project.find(1).pledges.create(amount: 50, backer_id: 1, reward_id: 1)