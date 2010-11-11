class CreateCatagorizations < ActiveRecord::Migration
  def self.up
    create_table :catagorizations do |t|
      t.integer :widget_id
      t.integer :catagory_id
      t.boolean :verified

      t.timestamps
    end
  end

  def self.down
    drop_table :catagorizations
  end
end
