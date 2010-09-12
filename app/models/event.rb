class Event < ActiveRecord::Base
  has_many :matches
  belongs_to :category
end
