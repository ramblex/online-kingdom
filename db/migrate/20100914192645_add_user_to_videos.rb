class AddUserToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :user_id, :int
  end

  def self.down
    remove_column :videos, :user_id
  end
end
