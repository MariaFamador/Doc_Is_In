class RemoveStatusFromAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :status, :string
  end
end
