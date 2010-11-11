class AddBoxIdToWidgets < ActiveRecord::Migration
  def self.up
    add_column :widgets, :box_id, :integer
  end

  def self.down
    remove_column :widgets, :box_id
  end
end
