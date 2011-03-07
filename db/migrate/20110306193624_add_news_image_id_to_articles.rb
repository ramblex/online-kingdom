class AddNewsImageIdToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :news_image_id, :integer
  end

  def self.down
    remove_column :articles, :news_image_id
  end
end
