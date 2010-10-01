class AddWebsiteToPartners < ActiveRecord::Migration
  def self.up
    add_column :partners, :website, :string
    add_column :partners, :prime, :boolean, :default => true
  end

  def self.down
    remove_column :partners, :website
    remove_column :partners, :prime
  end
end
