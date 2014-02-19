class Medicine < ActiveRecord::Base
  has_many :prescription_guides
  has_many :symptoms, through: :prescription_guides
  has_many :dosages

  belongs_to :prescription
end
