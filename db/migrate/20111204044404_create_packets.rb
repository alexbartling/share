class CreatePackets < ActiveRecord::Migration
  def self.up
    create_table :packets do |t|
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :packets
  end
end
