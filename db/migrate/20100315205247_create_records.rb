class CreateRecords < ActiveRecord::Migration
  def self.up
    create_table :records do |t|
      t.integer :domain_id
      t.string :address
      t.string :acl

      t.timestamps
    end
  end

  def self.down
    drop_table :records
  end
end
