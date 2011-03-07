class CreateNewsImages < ActiveRecord::Migration
  def self.up
    create_table :news_images do |t|
      t.string :image_uid
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :news_images
  end
end
