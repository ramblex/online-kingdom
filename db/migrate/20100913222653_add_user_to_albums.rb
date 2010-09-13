class AddUserToAlbums < ActiveRecord::Migration
  def self.up
    add_column :albums, :user_id, :int
  end

  def self.down
    remove_column :albums, :user_id
  end
end
