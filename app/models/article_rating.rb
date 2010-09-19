class ArticleRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  validates_uniqueness_of :user_id, :scope => [:article_id]
  validates_presence_of :user_id, :article_id, :rating
  validates_inclusion_of :rating, :in => 1..5, :message => 'rating must be between 1 and 5'
end
