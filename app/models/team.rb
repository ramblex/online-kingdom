class Team < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :players
  has_many :matches
end
