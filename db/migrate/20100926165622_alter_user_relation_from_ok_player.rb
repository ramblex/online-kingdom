class AlterUserRelationFromOkPlayer < ActiveRecord::Migration
  def self.up
    rename_column :ok_players, :profile_num, :user_id
  end

  def self.down
    rename_column :ok_players, :user_id, :profile_num
  end
end
