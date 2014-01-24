FactoryGirl.define do
  factory :user do 
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email.downcase }
    password 'password'
    password_confirmation 'password'
    role 'doctor'
  end
end
