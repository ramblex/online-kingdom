class CreatePrints < ActiveRecord::Migration
  def self.up
    create_table :prints do |t|
      t.string :image_file_name
      t.string :image_file_size
      t.string :image_content_type
      t.timestamps
    end
  end

  def self.down
    drop_table :prints
  end
end
