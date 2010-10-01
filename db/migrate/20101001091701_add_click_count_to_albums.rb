class AddClickCountToAlbums < ActiveRecord::Migration
  def self.up
    add_column :albums, :click_count, :integer, :default => 0
  end

  def self.down
    remove_column :albums, :click_count
  end
end
