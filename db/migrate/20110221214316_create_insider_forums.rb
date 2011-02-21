class CreateInsiderForums < ActiveRecord::Migration
  def self.up
    create_table :forums do |t|
      t.string :name
      t.text :description
      t.timestamps
    end

    create_table :topics do |t|
      t.string :name
      t.integer :last_poster_id
      t.datetime :last_post_at
      t.integer :forum_id
      t.integer :user_id
      t.timestamps
    end

    create_table :posts do |t|
      t.text :content
      t.integer :topic_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :forums
    drop_table :topics
    drop_table :posts
  end
end
