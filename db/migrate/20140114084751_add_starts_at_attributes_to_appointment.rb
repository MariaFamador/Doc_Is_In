class AddStartsAtAttributesToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :starts_at_date, :datetime
    add_column :appointments, :starts_at_time, :datetime
  end
end
