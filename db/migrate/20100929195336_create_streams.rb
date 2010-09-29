class CreateStreams < ActiveRecord::Migration
  def self.up
    create_table :streams do |t|
      t.string :title
      t.integer :event_id
      t.string :channel
      t.text :details
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :streams
  end
end
