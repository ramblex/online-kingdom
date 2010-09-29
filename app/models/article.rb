class Article < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 5
  default_scope :order => 'created_at DESC'
  named_scope :approved, :conditions => ['approved = 1']
  named_scope :front_page, :limit => 5
  named_scope :news_category, lambda {|id| {:conditions => ['news_category_id = ? ', id]}}
  belongs_to :category
  belongs_to :news_category
  belongs_to :user
  has_many :article_ratings
  has_many :comments
  has_many :article_editors

  validates_presence_of :category_id, :title, :content, :user_id, :preamble, :news_category_id

  has_attached_file :image, :styles => {
    :default => "202x139",
    :square => "128x128#",
    :slider => "275x180"
  }

  def rating
    if article_ratings.size.eql? 0
      0
    else
      article_ratings.inject(0) { |sum,x| sum += x.rating } / article_ratings.size
    end
  end
end
