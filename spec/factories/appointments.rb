FactoryGirl.define do
  factory :appointment do
    user
    patient
    starts_at_time ("23 Jan 2014").to_time
    starts_at_date ("23 Jan 2014").to_date
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    patient_id "43"
    user_id "10"
  end
end