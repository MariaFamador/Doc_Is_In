class Patient < ActiveRecord::Base
  belongs_to :user
  has_many :appointments, dependent: :destroy
  accepts_nested_attributes_for :appointments, allow_destroy: true

  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true
  validates :dob, :gender, presence: true

  searchkick

  def age
    Date.today.year - dob.year
  end

  def full_name
    name = "#{last_name}, " + ""
    name += "#{first_name} "
    name += "#{middle_name}" unless middle_name.nil?
  end
end

