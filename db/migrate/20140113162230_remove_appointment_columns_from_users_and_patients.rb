class RemoveAppointmentColumnsFromUsersAndPatients < ActiveRecord::Migration
  def change
    remove_column :users, :appointments, :date
    remove_column :users, :appointment_id, :integer
    remove_column :patients, :appointments, :date
    remove_column :patients, :appointment_id, :integer
  end
end
