class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }, 
            if: -> { new_record? }
  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  validates :password, :password_confirmation, presence: true, length: { minimum: 8 }, if: -> { new_record? }
  validates :role, presence: true, if: -> { id }

  attr_accessor :appointments_attributes
  has_many :patients
  has_many :appointments, dependent: :destroy
  accepts_nested_attributes_for :appointments, allow_destroy: true

  before_save { email.downcase! }
end
