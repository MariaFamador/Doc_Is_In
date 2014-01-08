class AddAppointmentAtts < ActiveRecord::Migration
  def change
    add_reference :appointments, :user, index: true
    add_reference :appointments, :patient, index: true
    add_column :appointments, :appointment_date, :date
    add_column :appointments, :first_name, :string
    add_column :appointments, :middle_name, :string
    add_column :appointments, :last_name, :string
    add_column :appointments, :doctor, :string
  end
end

