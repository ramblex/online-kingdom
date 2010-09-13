class AddUserToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :user_id, :int
  end

  def self.down
    remove_column :matches, :user_id
  end
end
