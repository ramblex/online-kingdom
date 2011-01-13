class Album < ActiveRecord::Base
  belongs_to :user
  has_many :album_photos
  has_many :album_ratings
  has_many :comments
  accepts_nested_attributes_for :album_photos, :allow_destroy => true,
    :reject_if => proc { |attributes| attributes.all? {|k,v| v.blank?}}

  has_friendly_id :name, :use_slug => true

  def rating
    if album_ratings.size.eql? 0
      0
    else
      album_ratings.inject(0) {|sum, x| sum += x.rating} / album_ratings.size
    end
  end

  define_index do
    indexes name
    indexes user.username
  end
end
