class CreateAlbumComments < ActiveRecord::Migration
  def self.up
    create_table :album_comments do |t|
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :album_comments
  end
end
