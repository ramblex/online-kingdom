class AddFormatToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :format_id, :integer
  end

  def self.down
    remove_column :events, :format_id
  end
end
