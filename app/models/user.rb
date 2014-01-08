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
  validates :first_name, presence: true, length: { maximum: 50 }, if: -> { id }
  validates :last_name, presence: true, length: { maximum: 50 }, if: -> { id }
  validates :password, :password_confirmation, presence: true, length: { minimum: 8 }, if: -> { new_record? }
  has_many :patients
  has_many :appointments

  before_save { email.downcase! }
  
end
