class Player < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
  belongs_to :category

  validates_presence_of :nickname

  has_attached_file :avatar, :styles => {:default => "100x100#", :mini => "50x50#"},
    :default_url => '/images/default-user.png'
end
