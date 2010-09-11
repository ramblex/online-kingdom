class AddUserIdToBlogs < ActiveRecord::Migration
  def self.up
    add_column :blogs, :user_id, :int
  end

  def self.down
    remove_column :blogs, :user_id
  end
end
