class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.integer :employerid
      t.integer :memberinfono

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
