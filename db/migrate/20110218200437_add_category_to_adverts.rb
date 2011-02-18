class AddCategoryToAdverts < ActiveRecord::Migration
  def self.up
    add_column :adverts, :category, :string
  end

  def self.down
    remove_column :adverts, :category
  end
end
