class Appointment < ActiveRecord::Base
  extend TimeSplitter::Accessors
  split_accessor :starts_at
  attr_accessor :starts_at_date, :starts_at_time, :form

  belongs_to :user
  belongs_to :patient

  before_validation :update_starts_at, if: -> { form == "booking_form" }

  validates :patient,
            :user,
            presence: true

  validates :starts_at_time, :starts_at_date, presence: true, if: -> { form == "booking_form" }
  validate :already_booked, if: -> { form == "booking_form" }

  def update_starts_at
    self.starts_at = "#{starts_at_date} #{starts_at_time}".to_datetime
  end

  def format_date
    "#{starts_at.strftime("%A, %d %b")}"
  end

  def format_time
    "#{starts_at.strftime("%H:%M")}"
  end

  def kancel
    form = "cancel"
    update(cancel: true)
  end

  def status
    if self.cancel == true
      "Cancelled"
    elsif local_time.past?
      "Done"
    elsif local_time.future?
      "Pending"
    end
  end

  def ends_at
    (self.starts_at + 15.minutes) if starts_at
  end

  private

  def already_booked
    appointment_durations = Appointment.pluck(:starts_at).map {|x| x..(x + 14.minutes) }

    if starts_at && appointment_durations.any? {|a| a.cover?(starts_at) } || 
      ends_at && appointment_durations.any? {|a| a.cover?(ends_at) }
      errors.add(:starts_at_time, "already booked")
      errors.add(:starts_at_date, "already booked")
    end
  end

  def local_time
    "#{starts_at.strftime("%A, %d %b %H:%M" )}".to_time
  end
end
