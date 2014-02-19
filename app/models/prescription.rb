class Prescription < ActiveRecord::Base
  has_many :medicines
  has_many :symptoms
  belongs_to :patient
  belongs_to :user

  validates :diagnosis, presence: true
end
