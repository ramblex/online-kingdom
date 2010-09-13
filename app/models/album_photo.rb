class AlbumPhoto < ActiveRecord::Base
  belongs_to :album

  has_attached_file :photo, :styles => {
    :default => '400x300',
    :slideshow => '200x300'
  }
end
