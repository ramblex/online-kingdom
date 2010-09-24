class Group < ActiveRecord::Base
  has_many :group_teams
  belongs_to :event

  accepts_nested_attributes_for :group_teams

  default_scope :order => 'name ASC'
end
