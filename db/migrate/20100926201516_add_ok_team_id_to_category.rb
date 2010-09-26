class AddOkTeamIdToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :ok_team_id, :integer
  end

  def self.down
    remove_column :categories, :ok_team_id
  end
end
