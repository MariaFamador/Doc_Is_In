class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.references :user, index: true
      t.references :account, index: true
      
      t.timestamps
    end
  end
end
