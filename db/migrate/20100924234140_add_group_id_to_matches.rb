class AddGroupIdToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :group_id, :integer
  end

  def self.down
    remove_column :matches, :group_id
  end
end
