class Account < ActiveRecord::Base
  self.inheritance_column = nil
  has_many :roles, inverse_of: :account
  has_many :users, through: :roles

  validates :type, :name, presence: true
  validates :slug, uniqueness: true

  before_save :generate_slug, if: -> { name_changed? }

  private

  def generate_slug
    self.slug = name.parameterize
  end
end
