class CreateInsiderEvents < ActiveRecord::Migration
  def self.up
    create_table :insider_events do |t|
      t.integer :event_id

      t.timestamps
    end
  end

  def self.down
    drop_table :insider_events
  end
end
