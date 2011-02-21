class Forum < ActiveRecord::Base
  has_many :topics, :dependent => :destroy
  has_many :posts, :through => :topics
  accepts_nested_attributes_for :topics
  attr_accessible :name, :description, :private

  has_friendly_id :name, :use_slug => true
end
