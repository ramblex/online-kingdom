class AlterMatchesScores < ActiveRecord::Migration
  def self.up
    change_column :matches, :team1_score, :int, :default => 0
    change_column :matches, :team2_score, :int, :default => 0
  end

  def self.down
  end
end
