class RemoveMemberTables < ActiveRecord::Migration
  def self.up
    drop_table :members
    drop_table :memberinfos
  end

  def self.down
  end
end
