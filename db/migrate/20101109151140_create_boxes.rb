class CreateBoxes < ActiveRecord::Migration
  def self.up
    create_table :boxes do |t|
      t.string :material
      t.string :color
      t.integer :order_id

      t.timestamps
    end
  end

  def self.down
    drop_table :boxes
  end
end
