class CreatePrescriptionGuides < ActiveRecord::Migration
  def change
    create_table :prescription_guides do |t|

      t.timestamps
    end
  end
end
