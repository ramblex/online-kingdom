class CreateMatchPlayers < ActiveRecord::Migration
  def self.up
    create_table :match_players do |t|
      t.integer :player_id
      t.integer :match_id
      t.integer :team_id

      t.timestamps
    end
  end

  def self.down
    drop_table :match_players
  end
end
