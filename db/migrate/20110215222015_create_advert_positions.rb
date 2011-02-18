class CreateAdvertPositions < ActiveRecord::Migration
  def self.up
    create_table :advert_positions do |t|
      t.string :name
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end

  def self.down
    drop_table :advert_positions
  end
end
