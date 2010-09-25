class AddOptionsToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :has_groups, :boolean, :default => false
    add_column :events, :has_brackets, :boolean, :default => false
  end

  def self.down
    remove_column :events, :has_brackets
    remove_column :events, :has_groups
  end
end
