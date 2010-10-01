class AddClicksToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :click_count, :integer
  end

  def self.down
    remove_column :matches, :click_count
  end
end
