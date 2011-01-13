class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  default_scope :order => 'blogs.created_at DESC'

  has_friendly_id :title, :use_slug => true
end
