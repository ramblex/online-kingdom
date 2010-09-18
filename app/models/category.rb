class Category < ActiveRecord::Base
  has_many :articles
  has_many :teams

  has_attached_file :small_icon, :styles => {:default => '25x15'},
    :default_url => '/images/default-category.gif'
end
