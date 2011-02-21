class Topic < ActiveRecord::Base
  belongs_to :forum
  belongs_to :user
  belongs_to :last_poster, :class_name => 'User'
  has_many :posts, :dependent => :destroy
  accepts_nested_attributes_for :posts
  default_scope :order => 'last_post_at DESC'

  has_friendly_id :name, :use_slug => true

  define_index do
    indexes name
  end
end
