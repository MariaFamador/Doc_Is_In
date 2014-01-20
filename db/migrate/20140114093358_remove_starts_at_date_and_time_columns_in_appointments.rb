class RemoveStartsAtDateAndTimeColumnsInAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :starts_at_date
    remove_column :appointments, :starts_at_time
  end
end
