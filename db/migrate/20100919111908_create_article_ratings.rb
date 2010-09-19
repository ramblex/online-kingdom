class CreateArticleRatings < ActiveRecord::Migration
  def self.up
    create_table :article_ratings do |t|
      t.int :user_id
      t.int :article_id
      t.int :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :article_ratings
  end
end
