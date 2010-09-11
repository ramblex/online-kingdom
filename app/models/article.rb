class Article < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 1
  default_scope :order => 'created_at DESC'
  belongs_to :category
  belongs_to :user
  validates_presence_of :category_id, :title, :content
  has_attached_file :image, :styles => { :default => "202x139#", :square => "128x128#"}
end
