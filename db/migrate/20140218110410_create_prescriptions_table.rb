class CreatePrescriptionsTable < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.string :diagnosis

      t.timestamps
    end
  end
end
