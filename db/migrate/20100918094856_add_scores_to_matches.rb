class AddScoresToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :team1_score, :int
    add_column :matches, :team2_score, :int
  end

  def self.down
    remove_column :matches, :team2_score
    remove_column :matches, :team1_score
  end
end
