class AddAlbumPhotoIdToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :album_photo_id, :integer
  end

  def self.down
    remove_column :comments, :album_photo_id
  end
end
