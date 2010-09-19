class AddForeignKeysToAlbumRatings < ActiveRecord::Migration
  def self.up
    add_column :album_ratings, :user_id, :int
    add_column :album_ratings, :album_id, :int
  end

  def self.down
    remove_column :album_ratings, :album_id
    remove_column :album_ratings, :user_id
  end
end
