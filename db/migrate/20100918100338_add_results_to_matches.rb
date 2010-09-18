class AddResultsToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :results, :text
  end

  def self.down
    remove_column :matches, :results
  end
end
