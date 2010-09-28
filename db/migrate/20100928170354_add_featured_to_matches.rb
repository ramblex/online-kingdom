class AddFeaturedToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :featured, :boolean
  end

  def self.down
    remove_column :matches, :featured
  end
end
