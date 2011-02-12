class AddMomentnewsToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :momentnews, :boolean
  end

  def self.down
    remove_column :articles, :momentnews
  end
end
