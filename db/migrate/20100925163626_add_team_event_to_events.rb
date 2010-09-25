class AddTeamEventToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :team_event, :boolean, :default => true
  end

  def self.down
    remove_column :events, :team_event
  end
end
