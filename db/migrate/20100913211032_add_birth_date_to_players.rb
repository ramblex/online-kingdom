class AddBirthDateToPlayers < ActiveRecord::Migration
  def self.up
    add_column :players, :birth_date, :date
  end

  def self.down
    remove_column :players, :birth_date
  end
end
