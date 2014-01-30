class CreateMedicalHistories < ActiveRecord::Migration
  def change
    create_table :medical_histories do |t|
      t.string :allergies, array: true, default: []
      t.string :previous_diseases, array: true, default: []
      t.string :family_diseases, array: true, default: []
      t.string :medication, array: true, default: []

      t.references :patient, index: true
      t.timestamps
    end
  end
end
