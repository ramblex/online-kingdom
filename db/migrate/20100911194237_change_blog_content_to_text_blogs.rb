class ChangeBlogContentToTextBlogs < ActiveRecord::Migration
  def self.up
    change_column :blogs, :content, :text
  end

  def self.down
    change_column :blogs, :content, :string
  end
end
