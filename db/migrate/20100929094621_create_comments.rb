class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :album_id
      t.integer :article_id
      t.integer :match_id
      t.integer :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
