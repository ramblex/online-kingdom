class CreateInsiders < ActiveRecord::Migration
  def self.up
    create_table :insiders do |t|
      t.text :description
      t.text :faq

      t.timestamps
    end
  end

  def self.down
    drop_table :insiders
  end
end
