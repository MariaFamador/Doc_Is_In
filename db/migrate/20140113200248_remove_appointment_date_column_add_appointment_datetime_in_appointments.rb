class RemoveAppointmentDateColumnAddAppointmentDatetimeInAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :appointment_date, :date
    add_column :appointments, :appointment_datetime, :datetime
  end
end
