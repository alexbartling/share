class AddFolderIdtoPackets < ActiveRecord::Migration
  def up
  add_column :packets, :folder_id, :integer
  add_index :packets, :folder_id
  end

  def down
    remove_column :packets, :folder_id, :integer
  end
end
