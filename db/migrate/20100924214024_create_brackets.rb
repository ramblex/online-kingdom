class CreateBrackets < ActiveRecord::Migration
  def self.up
    create_table :brackets do |t|
      t.integer :event_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :brackets
  end
end
