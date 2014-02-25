class Prescription < ActiveRecord::Base
  attr_accessor :medicines_attributes, :symptoms_attributes

  has_many :medicines
  has_many :symptoms
  
  belongs_to :patient
  belongs_to :user

  accepts_nested_attributes_for :medicines, allow_destroy: true
  accepts_nested_attributes_for :symptoms, allow_destroy: true

  validates :diagnosis, presence: true

  def format_created_at
    created_at.strftime("%d %b %Y - %R - %A")
  end
end
