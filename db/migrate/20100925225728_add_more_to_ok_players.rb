class AddMoreToOkPlayers < ActiveRecord::Migration
  def self.up
    add_column :ok_players, :short_description, :text
    add_column :ok_players, :category_id, :integer
    add_column :ok_players, :role, :string
  end

  def self.down
    remove_column :ok_players, :role
    remove_column :ok_players, :category_id
    remove_column :ok_players, :short_description
  end
end
