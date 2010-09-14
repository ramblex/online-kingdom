class Team < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :players
  has_many :matches

  has_attached_file :logo, :styles => { :default => '100x100#' }
end
