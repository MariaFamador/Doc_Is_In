class Role < ActiveRecord::Base
  belongs_to :account, inverse_of: :roles
  belongs_to :user, inverse_of: :roles

  validate :name, presence: true
end
