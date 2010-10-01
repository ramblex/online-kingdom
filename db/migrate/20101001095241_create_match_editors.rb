class CreateMatchEditors < ActiveRecord::Migration
  def self.up
    create_table :match_editors do |t|
      t.integer :match_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :match_editors
  end
end
