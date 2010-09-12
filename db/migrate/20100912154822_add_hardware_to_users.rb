class AddHardwareToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :headset, :string
    add_column :users, :mousepad, :string
    add_column :users, :keyboard, :string
    add_column :users, :mouse, :string
    add_column :users, :monitor, :string
    add_column :users, :motherboard, :string
    add_column :users, :cpu, :string
    add_column :users, :graphicscard, :string
    add_column :users, :memory, :string
    add_column :users, :hdd, :string
    add_column :users, :gamepad, :string
  end

  def self.down
    remove_column :users, :gamepad
    remove_column :users, :hdd
    remove_column :users, :memory
    remove_column :users, :graphicscard
    remove_column :users, :cpu
    remove_column :users, :motherboard
    remove_column :users, :monitor
    remove_column :users, :mouse
    remove_column :users, :keyboard
    remove_column :users, :mousepad
    remove_column :users, :headset
  end
end
