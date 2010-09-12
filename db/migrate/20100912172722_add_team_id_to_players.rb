class AddTeamIdToPlayers < ActiveRecord::Migration
  def self.up
    add_column :players, :team_id, :int
  end

  def self.down
    remove_column :players, :team_id
  end
end
