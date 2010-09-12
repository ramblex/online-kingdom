class Team < ActiveRecord::Base
  belongs_to :category
  has_many :players
end
