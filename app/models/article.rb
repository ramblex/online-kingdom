class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates_presence_of :category_id, :title, :content
  has_attached_file :image, :styles => { :default => "202x139#", :square => "128x128#"}
end
