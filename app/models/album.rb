class Album < ActiveRecord::Base
  belongs_to :user
  has_many :album_photos
  accepts_nested_attributes_for :album_photos, :allow_destroy => true, 
    :reject_if => proc { |attributes| attributes.all? {|k,v| v.blank?}}
end
