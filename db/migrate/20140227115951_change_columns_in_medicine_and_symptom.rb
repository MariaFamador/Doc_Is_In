class ChangeColumnsInMedicineAndSymptom < ActiveRecord::Migration
  def change
    rename_column :medicines, :medicine_name, :name
    rename_column :symptoms, :symptom_name, :name
  end
end
