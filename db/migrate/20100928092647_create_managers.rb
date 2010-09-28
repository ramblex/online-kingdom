class CreateManagers < ActiveRecord::Migration
  def self.up
    create_table :managers do |t|
      t.string :firstname
      t.string :surname
      t.string :nickname
      t.string :role
      t.integer :user_id
      t.text :short_description
      t.boolean :is_high_management

      t.timestamps
    end
  end

  def self.down
    drop_table :managers
  end
end
