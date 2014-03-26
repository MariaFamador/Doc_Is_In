account = Account.find_by(slug: "docisin")
unless account
  puts "Creating Doc is in"
  account = Account.create(name: "Docisin", type: "dental")
end

user = User.find_by(email: "gjaldon@docisin.com")
unless user
  puts "Creating gjaldon@docisin.com"
  User.create(
    accounts: [account],
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
    accounts: [account],
    email: "mfamador@docisin.com",
    first_name: "Regina",
    last_name: "Famador",
    password: "passw0rk",
    password_confirmation: "passw0rk")
end
