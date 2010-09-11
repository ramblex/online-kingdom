class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.int :user_id
      t.string :title
      t.string :content
      t.boolean :deleted

      t.timestamps
    end
  end

  def self.down
    drop_table :blogs
  end
end
