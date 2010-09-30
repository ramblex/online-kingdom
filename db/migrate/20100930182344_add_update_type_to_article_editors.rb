class AddUpdateTypeToArticleEditors < ActiveRecord::Migration
  def self.up
    add_column :article_editors, :update_type, :string, :default => 'Edited'
  end

  def self.down
    remove_column :article_editors, :update_type
  end
end
