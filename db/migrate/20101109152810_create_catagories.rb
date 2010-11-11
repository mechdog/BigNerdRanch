class CreateCatagories < ActiveRecord::Migration
  def self.up
    create_table :catagories do |t|
      t.string :name
      t.integer :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :catagories
  end
end
