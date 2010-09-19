class AddForeignKeysToAlbumComments < ActiveRecord::Migration
  def self.up
    add_column :album_comments, :user_id, :int
    add_column :album_comments, :album_id, :int
    add_column :album_comments, :album_photo_id, :int
  end

  def self.down
    remove_column :album_comments, :album_photo_id
    remove_column :album_comments, :album_id
    remove_column :album_comments, :user_id
  end
end
