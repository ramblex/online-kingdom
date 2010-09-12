class TeamIdsToMatchMaps < ActiveRecord::Migration
  def self.up
    add_column :match_maps, :team1_id, :int
    add_column :match_maps, :team2_id, :int
  end

  def self.down
    remove_column :match_maps, :team1_id, :int
    remove_column :match_maps, :team2_id, :int
  end
end
