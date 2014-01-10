class AddAppointmentsToUser < ActiveRecord::Migration
  def change
    add_column :users, :appointments, :date
    add_column :users, :appointment_id, :integer
  end
end
