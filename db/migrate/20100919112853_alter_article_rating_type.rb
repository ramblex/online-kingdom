class AlterArticleRatingType < ActiveRecord::Migration
  def self.up
    add_column :article_ratings, :rating, :decimal
    add_column :article_ratings, :user_id, :int
    add_column :article_ratings, :article_id, :int
  end

  def self.down
    remove_column :article_ratings, :rating
    remove_column :article_ratings, :user_id
    remove_column :article_ratings, :article_id
  end
end
