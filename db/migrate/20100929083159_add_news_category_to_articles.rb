class AddNewsCategoryToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :news_category_id, :integer
  end

  def self.down
    remove_column :articles, :news_category_id
  end
end
