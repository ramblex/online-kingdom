class AddStageToGroups < ActiveRecord::Migration
  def self.up
    add_column :groups, :stage, :string
  end

  def self.down
    remove_column :groups, :stage
  end
end
