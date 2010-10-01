class CreateInsiderPrizes < ActiveRecord::Migration
  def self.up
    create_table :insider_prizes do |t|
      t.string :name
      t.string :company
      t.string :product_link
      t.integer :insider_id

      t.timestamps
    end
  end

  def self.down
    drop_table :insider_prizes
  end
end
