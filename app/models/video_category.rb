class VideoCategory < ActiveRecord::Base
  has_many :videos
  validates_presence_of :name
end
