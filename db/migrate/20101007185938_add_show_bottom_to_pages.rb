class AddShowBottomToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :show_link, :boolean
  end

  def self.down
    remove_column :pages, :show_link
  end
end
