class AddAppointmentIdToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :appointment_id, :integer
  end
end
