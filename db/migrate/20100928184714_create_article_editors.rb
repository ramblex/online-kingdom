class CreateArticleEditors < ActiveRecord::Migration
  def self.up
    create_table :article_editors do |t|
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
  end

  def self.down
    drop_table :article_editors
  end
end
