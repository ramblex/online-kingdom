class AddInsiderIdToInsiderEvents < ActiveRecord::Migration
  def self.up
    add_column :insider_events, :insider_id, :integer
  end

  def self.down
    remove_column :insider_events, :insider_id
  end
end
