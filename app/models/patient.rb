class Patient < ActiveRecord::Base
  belongs_to :user

  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true

  def age
    Date.today.year - dob.year
  end
end
