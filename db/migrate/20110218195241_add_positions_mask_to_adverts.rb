class AddPositionsMaskToAdverts < ActiveRecord::Migration
  def self.up
    add_column :adverts, :positions_mask, :integer
  end

  def self.down
    remove_column :adverts, :positions_mask
  end
end
