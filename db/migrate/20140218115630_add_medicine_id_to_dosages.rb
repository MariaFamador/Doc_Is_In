class AddMedicineIdToDosages < ActiveRecord::Migration
  def change
    add_reference :prescription_guides, :medicine, index: true
    add_reference :symptoms, :medicine, index: true
    add_reference :dosages, :medicine, index: true
    add_reference :prescription_guides, :symptom, index: true
    add_reference :medicines, :symptom, index: true
    add_reference :medicines, :prescription, index: true
    add_reference :symptoms, :prescription, index: true
    add_reference :dosages, :patient, index: true
  end
end
