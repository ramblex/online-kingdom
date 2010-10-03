class AddInsiderIdToInsiderServers < ActiveRecord::Migration
  def self.up
    add_column :insider_servers, :insider_id, :integer
  end

  def self.down
    remove_column :insider_servers, :insider_id
  end
end
