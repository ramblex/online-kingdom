class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.int :category_id
      t.boolean :featured
      t.boolean :approved
      t.int :poster_id
      t.int :approver_id
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
