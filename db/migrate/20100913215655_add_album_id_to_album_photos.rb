class AddAlbumIdToAlbumPhotos < ActiveRecord::Migration
  def self.up
    add_column :album_photos, :album_id, :int
  end

  def self.down
    remove_column :album_photos, :album_id
  end
end
