class CreateGroupTeams < ActiveRecord::Migration
  def self.up
    create_table :group_teams do |t|
      t.integer :group_id
      t.integer :team_id

      t.timestamps
    end
  end

  def self.down
    drop_table :group_teams
  end
end
