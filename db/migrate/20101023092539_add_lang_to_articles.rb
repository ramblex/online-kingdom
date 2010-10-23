class AddLangToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :lang, :string, :default => "English"
  end

  def self.down
    remove_column :articles, :lang
  end
end
