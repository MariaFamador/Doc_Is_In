FactoryGirl.define do
  factory :patient do
    user
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    gender { %w[Male Female][rand(0..1)] }
    dob  { Date.today - rand(10000..20000) }
    address { Faker::Address.street_address }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end