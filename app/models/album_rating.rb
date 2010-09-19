class AlbumRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :album

  validates_uniqueness_of :user_id, :scope => [:album_id]
end
