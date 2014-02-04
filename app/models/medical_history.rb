class MedicalHistory < ActiveRecord::Base
  ALLERGIES = %w[Penicillin Dust Seafoods Fur Alcohol Antibiotics Peanuts Mushrooms].sort.push("Other").unshift("None")
  PREVIOUS_DISEASES = %w[Measles Mumps Meningitis].sort.push("Other").unshift("None")

  belongs_to :patient

  validates :patient_id, presence: true
end
