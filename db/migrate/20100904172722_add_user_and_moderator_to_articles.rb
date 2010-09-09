class AddUserAndModeratorToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :user_id, :int
    add_column :articles, :moderator_id, :int
  end

  def self.down
    remove_column :articles, :moderator_id
    remove_column :articles, :user_id
  end
end
