class AddNamesToMedicinesAndSymptoms < ActiveRecord::Migration
  def change
    add_column :medicines, :medicine_name, :string
    add_column :symptoms, :symptom_name, :string
    add_column :dosages, :prescribed_amount, :string
    add_column :prescriptions, :patient_name, :string
    add_column :prescriptions, :doctor_name, :string
  end
end
