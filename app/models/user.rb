class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :patients
  has_many :appointments, dependent: :destroy
  has_many :prescriptions, dependent: :destroy

  accepts_nested_attributes_for :appointments, allow_destroy: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }, 
            if: -> { new_record? }
  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  validates :password, :password_confirmation, presence: true, length: { minimum: 8 }, if: -> { new_record? }

  attr_accessor :appointments_attributes

  before_save { email.downcase! }
end
