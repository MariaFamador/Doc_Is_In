class ChangeStatusToString < ActiveRecord::Migration
  def change
    remove_column :appointments, :status, array: true, default: []

    add_column :appointments, :status, :string
  end
end
