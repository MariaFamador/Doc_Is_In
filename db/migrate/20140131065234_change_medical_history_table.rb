class ChangeMedicalHistoryTable < ActiveRecord::Migration
  def change
    remove_column :medical_histories, :medication, :string, array: true, defaut: '[]'
    remove_column :medical_histories, :family_diseases, :string, array: true, default: '[]'

    add_column :medical_histories, :medication_and_supplements, :text
    add_column :medical_histories, :family_history, :text
    add_column :medical_histories, :surgery_and_hospitalization, :text
    add_column :medical_histories, :notes, :text
  end
end
