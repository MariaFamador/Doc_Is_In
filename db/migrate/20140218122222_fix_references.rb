class FixReferences < ActiveRecord::Migration
  def change
    add_reference :prescriptions, :user, index: true
    add_reference :prescriptions, :patient, index: true
  end
end
