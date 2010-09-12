class AddCategoryIdToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :category_id, :int
  end

  def self.down
    remove_column :events, :category_id
  end
end
