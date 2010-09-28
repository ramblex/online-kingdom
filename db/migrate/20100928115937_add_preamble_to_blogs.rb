class AddPreambleToBlogs < ActiveRecord::Migration
  def self.up
    add_column :blogs, :preamble, :text
  end

  def self.down
    remove_column :blogs, :preamble
  end
end
