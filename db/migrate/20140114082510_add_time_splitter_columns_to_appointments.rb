class AddTimeSplitterColumnsToAppointments < ActiveRecord::Migration
  def change
    rename_column :appointments, :appointment_datetime, :starts_at
  end
end
