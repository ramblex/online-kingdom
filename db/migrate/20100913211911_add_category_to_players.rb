class AddCategoryToPlayers < ActiveRecord::Migration
  def self.up
    add_column :players, :category_id, :int
  end

  def self.down
    remove_column :players, :category_id
  end
end
