class AddCommentsAndDateToStreams < ActiveRecord::Migration
  def self.up
    add_column :streams, :comments, :string
    add_column :streams, :on_at, :datetime
  end

  def self.down
    remove_column :streams, :on_at
    remove_column :streams, :comments
  end
end
