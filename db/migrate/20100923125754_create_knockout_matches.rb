class CreateKnockoutMatches < ActiveRecord::Migration
  def self.up
    create_table :knockout_matches do |t|
      t.integer :match_id
      t.integer :position
      t.integer :column

      t.timestamps
    end
  end

  def self.down
    drop_table :knockout_matches
  end
end
