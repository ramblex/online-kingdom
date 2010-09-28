class ArticleComment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates_presence_of :content
end
