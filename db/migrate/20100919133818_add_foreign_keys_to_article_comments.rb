class AddForeignKeysToArticleComments < ActiveRecord::Migration
  def self.up
    add_column :article_comments, :user_id, :int
    add_column :article_comments, :article_id, :int
  end

  def self.down
    remove_column :article_comments, :article_id
    remove_column :article_comments, :user_id
  end
end
