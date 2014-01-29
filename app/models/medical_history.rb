class MedicalHistory < ActiveRecord::Base
  ALLERGIES = %w[Penicillin Dust Seafoods]
  belongs_to :patients
end
