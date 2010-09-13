class AlbumPhoto < ActiveRecord::Base
  belongs_to :album
  default_scope :order => 'created_at DESC'

  has_attached_file :photo, :styles => {
    :default => '400x300',
    :slideshow => '200x300',
    :thumb => '120x90#'
  }
end
