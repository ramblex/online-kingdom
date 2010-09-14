class AddCategoryToAwards < ActiveRecord::Migration
  def self.up
    add_column :awards, :category_id, :int
  end

  def self.down
    remove_column :awards, :category_id
  end
end
