class AddMatchIdToMatchMaps < ActiveRecord::Migration
  def self.up
    add_column :match_maps, :match_id, :int
  end

  def self.down
    remove_column :match_maps, :match_id
  end
end
