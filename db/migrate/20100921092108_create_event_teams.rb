class CreateEventTeams < ActiveRecord::Migration
  def self.up
    create_table :event_teams do |t|
      t.integer :position
      t.integer :team_id
      t.integer :event_id

      t.timestamps
    end
  end

  def self.down
    drop_table :event_teams
  end
end
