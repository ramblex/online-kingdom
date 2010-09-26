class AddFeaturedToPartners < ActiveRecord::Migration
  def self.up
    add_column :partners, :featured, :boolean
  end

  def self.down
    remove_column :partners, :featured
  end
end
