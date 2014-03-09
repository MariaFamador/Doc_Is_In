# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.find_by(email: "gjaldon@docisin.com")
unless user
  puts "Creating gjaldon@docisin.com"
  User.create(
    email: "gjaldon@docisin.com",
    first_name: "Gabe",
    last_name: "Jaldon",
    password: "passw0rk",
    password_confirmation: "passw0rk")
end

user1 = User.find_by(email: "mfamador@docisin.com")
unless user1
  puts "Creating mfamador@docisin.com"
  User.create(
    email: "mfamador@docisin.com",
    first_name: "Regina",
    last_name: "Famador",
    password: "passw0rk",
    password_confirmation: "passw0rk")
end
