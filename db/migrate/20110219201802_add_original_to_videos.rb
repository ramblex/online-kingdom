class AddOriginalToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :original, :string
  end

  def self.down
    remove_column :videos, :original
  end
end
