class AddVideoIdToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :video_id, :integer
  end

  def self.down
    remove_column :comments, :video_id
  end
end
