class AddCategoryIdToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :category_id, :int
  end

  def self.down
    remove_column :matches, :category_id
  end
end
