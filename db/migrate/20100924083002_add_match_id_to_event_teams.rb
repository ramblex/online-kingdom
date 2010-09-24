class AddMatchIdToEventTeams < ActiveRecord::Migration
  def self.up
    add_column :event_teams, :match_id, :integer
  end

  def self.down
    remove_column :event_teams, :match_id
  end
end
