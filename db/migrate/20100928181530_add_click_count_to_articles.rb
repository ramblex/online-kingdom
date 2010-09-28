class AddClickCountToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :click_count, :integer, :default => 0
  end

  def self.down
    remove_column :articles, :click_count
  end
end
