class ChangeNewsImagesToPaperclip < ActiveRecord::Migration
  def self.up
    rename_column :news_images, :image_uid, :image_file_name
  end

  def self.down
    rename_column :news_images, :image_file_name, :image_uid
  end
end
