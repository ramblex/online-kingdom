class Advert < ActiveRecord::Base
  POSITIONS = %w[top
                 events_list
                 events
                 videos_list
                 albums_list
                 main_page
                 blogs_list
                 blogs
                 streams
                 matches_list
                 news_articles
                 streams_1
                 streams_2
                 matches_list
                 matches]
  validates_presence_of :company
  named_scope :random, lambda { |pos| {
    :conditions => ['positions_mask & ? != 0', 2**POSITIONS.index(pos)],
    :order => 'RAND()',
    :limit => 1}}
  attr_accessible :positions_mask, :company, :code, :url, :positions, :category, :image

  def positions=(positions)
    self.positions_mask = (positions & POSITIONS).map { |r| 2**POSITIONS.index(r) }.sum
  end

  def positions
    POSITIONS.reject { |r| ((positions_mask || 0) & 2**POSITIONS.index(r)).zero? }
  end

  has_attached_file :image, :styles => {
    :top => "415x110!",
    :right_side => "285x1000>",
    :main_page => "512x1000>"
  },
  :url => '/system/:class/:id/:style/:basename.:extension',
  :path => ':rails_root/public/system/:class/:id/:style/:basename.:extension'
end
