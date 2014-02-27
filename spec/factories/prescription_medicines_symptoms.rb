FactoryGirl.define do
  factory :medicine do
    name { 'Methotrexate 2.5mg' }
  end

  factory :symptom do
    name { 'Chills' }
  end

  factory :prescription do
    patient
    user
    diagnosis { "Test" }
  end
end