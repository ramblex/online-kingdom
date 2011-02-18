class CreateAdverts < ActiveRecord::Migration
  def self.up
    create_table :adverts do |t|
      t.integer :advert_position_id
      t.string :type
      t.text :code
      t.string :url
      t.string :company

      t.timestamps
    end
  end

  def self.down
    drop_table :adverts
  end
end
