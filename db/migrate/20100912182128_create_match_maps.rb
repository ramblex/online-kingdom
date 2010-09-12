class CreateMatchMaps < ActiveRecord::Migration
  def self.up
    create_table :match_maps do |t|
      t.int :team1_score
      t.int :team2_score

      t.timestamps
    end
  end

  def self.down
    drop_table :match_maps
  end
end
