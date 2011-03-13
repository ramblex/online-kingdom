class NewsImage < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 12

  has_attached_file :image, :styles => {
    :default => "202x139",
    :square => "128x128#",
    :slider => "275x180"
  }, :default => :default
  validates_presence_of :name, :image
end
