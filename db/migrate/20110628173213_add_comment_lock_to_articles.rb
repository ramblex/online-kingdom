class AddCommentLockToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :comments_locked, :boolean, :default => false
  end

  def self.down
    remove_column :articles, :comments_locked
  end
end
