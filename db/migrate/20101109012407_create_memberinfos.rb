class CreateMemberinfos < ActiveRecord::Migration
  def self.up
    create_table :memberinfos do |t|
      t.integer :memberid
      t.string :name_first
      t.string :name_last
      t.date :dob
      t.timestamp :modify_date
      t.date :entry_date

      t.timestamps
    end
  end

  def self.down
    drop_table :memberinfos
  end
end
