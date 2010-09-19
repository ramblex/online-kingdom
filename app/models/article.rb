class Article < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 5
  default_scope :order => 'created_at DESC'
  named_scope :approved, :conditions => ['approved = 1']
  belongs_to :category
  belongs_to :user
  belongs_to :moderator, :class_name => 'User', :foreign_key => 'moderator_id'

  validates_presence_of :category_id, :title, :content, :user_id
  validates_presence_of :moderator_id, :if => :approved

  has_attached_file :image, :styles => { :default => "202x139#", :square => "128x128#"}
end
