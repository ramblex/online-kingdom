class SetRatingDefault < ActiveRecord::Migration
  def self.up
    change_column :article_ratings, :rating, :decimal, :default => 2.5
  end

  def self.down
  end
end
