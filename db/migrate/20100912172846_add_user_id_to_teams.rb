class AddUserIdToTeams < ActiveRecord::Migration
  def self.up
    add_column :teams, :user_id, :int
  end

  def self.down
    remove_column :teams, :user_id
  end
end
