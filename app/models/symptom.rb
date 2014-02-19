class Symptom < ActiveRecord::Base
  has_many :prescription_guides
  has_many :medicines, through: :prescription_guides
  belongs_to :prescription
end
