class AddNameToInsiderFiles < ActiveRecord::Migration
  def self.up
    add_column :insider_files, :name, :string
  end

  def self.down
    remove_column :insider_files, :name
  end
end
