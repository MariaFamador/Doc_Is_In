class Account < ActiveRecord::Base
  self.inheritance_column = nil
  has_many :roles, inverse_of: :account
  has_many :users, through: :roles

  validates :type, :name, presence: true
end
