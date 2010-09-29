class NewsCategory < ActiveRecord::Base
  has_many :articles
end
