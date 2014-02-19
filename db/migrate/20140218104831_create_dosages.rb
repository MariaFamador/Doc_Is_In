class CreateDosages < ActiveRecord::Migration
  def change
    create_table :dosages do |t|

      t.timestamps
    end
  end
end
