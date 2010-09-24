class ChangeEventTeamsToBrackets < ActiveRecord::Migration
  def self.up
    rename_column :event_teams, :event_id, :bracket_id
  end

  def self.down
    rename_column :event_teams, :bracket_id, :event_id
  end
end
