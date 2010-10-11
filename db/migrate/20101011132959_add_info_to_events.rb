class AddInfoToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :information, :text
  end

  def self.down
    remove_column :events, :information
  end
end
