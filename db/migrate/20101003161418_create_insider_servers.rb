class CreateInsiderServers < ActiveRecord::Migration
  def self.up
    create_table :insider_servers do |t|
      t.string :country
      t.string :name
      t.string :ip

      t.timestamps
    end
  end

  def self.down
    drop_table :insider_servers
  end
end
