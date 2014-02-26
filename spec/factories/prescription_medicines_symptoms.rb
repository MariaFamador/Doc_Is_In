FactoryGirl.define do
  factory :medicine do
    medicine_name { 'Methotrexate 2.5mg' }
  end

  factory :symptom do
    symptom_name { 'Chills' }
  end

  factory :prescription do
    patient
    user
    diagnosis { "Test" }
  end
end