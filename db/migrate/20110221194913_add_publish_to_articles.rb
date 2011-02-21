class AddPublishToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :published, :boolean, :default => true
  end

  def self.down
    remove_column :articles, :published
  end
end
