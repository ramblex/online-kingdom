class AddProfileInfoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :birthdate, :date
    add_column :users, :city, :string
    add_column :users, :description, :text
    add_column :users, :firstname, :string
    add_column :users, :surname, :string
  end

  def self.down
    remove_column :users, :surname
    remove_column :users, :firstname
    remove_column :users, :description
    remove_column :users, :city
    remove_column :users, :birthdate
  end
end
