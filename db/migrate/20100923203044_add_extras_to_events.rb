class AddExtrasToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :user_id, :integer
    add_column :events, :start_date, :date
    add_column :events, :end_date, :date
  end

  def self.down
    remove_column :events, :end_date
    remove_column :events, :start_date
    remove_column :events, :user_id
  end
end
