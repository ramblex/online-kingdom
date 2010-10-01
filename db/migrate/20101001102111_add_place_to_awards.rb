class AddPlaceToAwards < ActiveRecord::Migration
  def self.up
    add_column :awards, :place, :string
  end

  def self.down
    remove_column :awards, :place
  end
end
