class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :album
  belongs_to :album_photo
  belongs_to :event
  belongs_to :user
  belongs_to :blog
  acts_as_tree :order => 'created_at ASC'

  attr_protected :user

  validates_length_of :content, :maximum => 1000
end
