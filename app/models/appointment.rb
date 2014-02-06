class Appointment < ActiveRecord::Base
  extend TimeSplitter::Accessors
  split_accessor :starts_at
  attr_accessor :starts_at_date, :starts_at_time

  belongs_to :user
  belongs_to :patient

  before_create :update_starts_at

  validates :patient,
            :user,
            :first_name,
            :last_name,
            presence: true

  validates :starts_at_time, :starts_at_date, presence: true, if: -> { form != "notes" }


  def update_starts_at
    self.starts_at = "#{starts_at_date} #{starts_at_time}".to_datetime
  end

  def format_date
    "#{starts_at.strftime("%A, %d %b")}"
  end

  def format_time
    "#{starts_at.strftime("%H:%M")}"
  end

  def local_time
    "#{format_date} #{format_time}".to_time
  end

  def status
    if local_time.past?
      "Done"
    elsif local_time.future?
      "Pending"
    end
  end

  def cancelled_status=(value)
    self.status = "Cancelled"
  end
end
