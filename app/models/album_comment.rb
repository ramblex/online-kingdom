class AlbumComment < ActiveRecord::Base
  belongs_to :album
  belongs_to :user
  belongs_to :album_photo
end
