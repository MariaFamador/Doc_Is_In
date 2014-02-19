class Dosage < ActiveRecord::Base
  belongs_to :patient
  belongs_to :medicine
end
