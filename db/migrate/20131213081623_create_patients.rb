class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string  :first_name
      t.string  :middle_name
      t.string  :last_name
      t.date    :dob
      t.integer :age
      t.string  :address
      t.string  :phone_number  
    
      t.timestamps
    end
  end
end
