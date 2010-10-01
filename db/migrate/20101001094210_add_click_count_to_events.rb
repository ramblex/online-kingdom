class AddClickCountToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :click_count, :integer, :default => 0
  end

  def self.down
    remove_column :events, :click_count
  end
end
