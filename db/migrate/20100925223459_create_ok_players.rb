class CreateOkPlayers < ActiveRecord::Migration
  def self.up
    create_table :ok_players do |t|
      t.string :firstname
      t.string :surname
      t.string :nickname
      t.integer :profile_num
      t.string :country

      t.timestamps
    end
  end

  def self.down
    drop_table :ok_players
  end
end
