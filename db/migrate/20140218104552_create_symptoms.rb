class CreateSymptoms < ActiveRecord::Migration
  def change
    create_table :symptoms do |t|

      t.timestamps
    end
  end
end
