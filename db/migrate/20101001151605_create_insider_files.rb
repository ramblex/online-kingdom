class CreateInsiderFiles < ActiveRecord::Migration
  def self.up
    create_table :insider_files do |t|
      t.integer :category_id
      t.integer :insider_id

      t.timestamps
    end
  end

  def self.down
    drop_table :insider_files
  end
end
