class Patient < ActiveRecord::Base
  searchkick word_start: [:first_name, :middle_name, :last_name]

  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_many :prescriptions, dependent: :destroy
  has_many :dosages, dependent: :destroy
  has_one :medical_history, dependent: :destroy


  accepts_nested_attributes_for :appointments, allow_destroy: true
  accepts_nested_attributes_for :medical_history

  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  validates :user, :dob, :gender, presence: true

  def age
    Date.today.year - dob.year
  end

  def full_name
    name = "#{last_name}, " + ""
    name += "#{first_name} "
    name += "#{middle_name}" unless middle_name.blank?
    name.strip
  end

  def initials
    name = "#{last_name}, " + ""
    name += "#{first_name.first}. "
    name += "#{middle_name.first}." unless middle_name.blank?
    name.strip
  end
end
