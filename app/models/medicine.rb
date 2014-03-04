class Medicine < ActiveRecord::Base
  searchkick word_start: [:name]
  attr_accessor :form
  
  has_many :prescription_guides
  has_many :symptoms, through: :prescription_guides
  has_many :dosages

  validates :name, presence: true, if: -> { form == "medicine_form" }

  belongs_to :prescription
end
