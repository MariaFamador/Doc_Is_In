class RemoveSymptomAndMedicineForeignKeys < ActiveRecord::Migration
  def change
    remove_reference :medicines, :symptom, index: true
    remove_reference :symptoms, :medicine, index: true
    add_reference :dosages, :prescription, index: true
  end
end
