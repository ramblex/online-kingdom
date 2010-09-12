class AddEventIdToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :event_id, :int
  end

  def self.down
    remove_column :matches, :event_id
  end
end
