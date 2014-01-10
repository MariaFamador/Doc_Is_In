class AddAppointmentsToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :appointments, :date
  end
end
