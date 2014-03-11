FactoryGirl.define do
  factory :account do
    name { Faker::Company.name }
    type { %w[dental medical].sample }
  end
end
