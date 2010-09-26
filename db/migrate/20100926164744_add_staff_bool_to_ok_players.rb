class AddStaffBoolToOkPlayers < ActiveRecord::Migration
  def self.up
    add_column :ok_players, :is_staff, :boolean
  end

  def self.down
    remove_column :ok_players, :is_staff
  end
end
