class AddTeamsToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :team1_id, :int
    add_column :matches, :team2_id, :int
  end

  def self.down
    remove_column :matches, :team2_id
    remove_column :matches, :team1_id
  end
end
