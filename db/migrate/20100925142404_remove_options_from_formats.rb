class RemoveOptionsFromFormats < ActiveRecord::Migration
  def self.up
    remove_column :formats, :has_groups
    remove_column :formats, :has_brackets
  end

  def self.down
  end
end
