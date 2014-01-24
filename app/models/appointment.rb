class Appointment < ActiveRecord::Base
  extend TimeSplitter::Accessors
  split_accessor :starts_at
  attr_accessor :starts_at_date, :starts_at_time

  belongs_to :user
  belongs_to :patient

  before_validation :update_starts_at

  validates :starts_at,
            :starts_at_time,
            :starts_at_date,
            :patient,
            :user,
            :first_name,
            :last_name,
            presence: true


  def update_starts_at
    self.starts_at = "#{starts_at_date} #{starts_at_time}".to_datetime
  end
end
