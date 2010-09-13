class AddUserIdToPlayers < ActiveRecord::Migration
  def self.up
    add_column :players, :user_id, :int
  end

  def self.down
    remove_column :players, :user_id
  end
end
