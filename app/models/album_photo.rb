class AlbumPhoto < ActiveRecord::Base
  belongs_to :album
  default_scope :order => 'created_at DESC'
  has_many :comments

  has_attached_file :photo, :styles => {
    :slideshow => '600x300',
    :default => '400x300',
    :thumb => '120x90#',
    :mini => '55x55#'
  }
end
