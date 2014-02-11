FactoryGirl.define do
  factory :appointment do
    user
    patient
    starts_at_date ("23 Jan 2014").to_date
    starts_at_time ("9:30").to_time
    starts_at ("23 Jan 2014 9:30").to_datetime
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
