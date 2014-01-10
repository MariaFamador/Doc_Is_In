class Patient < ActiveRecord::Base
  belongs_to :user
  has_many :appointments
  accepts_nested_attributes_for :appointments

  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true
  validates :dob, :gender, presence: true

  def age
    Date.today.year - dob.year
  end
end
