class AddColumnToEventTeams < ActiveRecord::Migration
  def self.up
    add_column :event_teams, :round, :integer
  end

  def self.down
    remove_column :event_teams, :round
  end
end
