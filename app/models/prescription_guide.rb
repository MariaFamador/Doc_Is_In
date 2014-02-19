class PrescriptionGuide < ActiveRecord::Base
  belongs_to :medicine
  belongs_to :symptom
end
