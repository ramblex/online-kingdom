class RenameMessagesToColumn < ActiveRecord::Migration
  def self.up
    rename_column :messages, :to_id, :receiver_id
  end

  def self.down
    rename_column :messages, :receiver_id, :to_id
  end
end
