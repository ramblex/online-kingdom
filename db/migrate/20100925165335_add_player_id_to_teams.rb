class AddPlayerIdToTeams < ActiveRecord::Migration
  def self.up
    add_column :teams, :player_id, :integer
  end

  def self.down
    remove_column :teams, :player_id
  end
end
