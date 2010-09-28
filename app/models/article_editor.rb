class ArticleEditor < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  named_scope :distinct, :select => 'DISTINCT user_id'
end
