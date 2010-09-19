class AddFormatToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :format_id, :int
  end

  def self.down
    remove_column :matches, :format_id
  end
end
