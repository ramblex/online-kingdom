class AddCategoryIdToTeams < ActiveRecord::Migration
  def self.up
    add_column :teams, :category_id, :int
  end

  def self.down
    remove_column :teams, :category_id
  end
end
