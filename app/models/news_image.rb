class NewsImage < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 12
  image_accessor :image

  validates_presence_of :name, :image
end
