class AddOptionsToFormats < ActiveRecord::Migration
  def self.up
    add_column :formats, :has_groups, :boolean
    add_column :formats, :has_brackets, :boolean
  end

  def self.down
    remove_column :formats, :has_brackets
    remove_column :formats, :has_groups
  end
end
