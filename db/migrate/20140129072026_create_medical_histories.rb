class CreateMedicalHistories < ActiveRecord::Migration
  def change
    create_table :medical_histories do |t|
      t.string :allergies, array: true
      t.string :previous_diseases, array: true
      t.string :family_diseases, array: true
      t.string :medication, array: true

      t.references :patient, index: true
      t.timestamps
    end
  end
end
