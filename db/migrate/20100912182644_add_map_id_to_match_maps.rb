class AddMapIdToMatchMaps < ActiveRecord::Migration
  def self.up
    add_column :match_maps, :map_id, :int
  end

  def self.down
    remove_column :match_maps, :map_id
  end
end
