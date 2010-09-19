class CreateAlbumRatings < ActiveRecord::Migration
  def self.up
    create_table :album_ratings do |t|
      t.int :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :album_ratings
  end
end
