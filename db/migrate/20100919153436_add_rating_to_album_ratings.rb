class AddRatingToAlbumRatings < ActiveRecord::Migration
  def self.up
    add_column :album_ratings, :rating, :int
  end

  def self.down
    remove_column :album_ratings, :rating
  end
end
