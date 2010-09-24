class Group < ActiveRecord::Base
  has_many :group_teams, :dependent => :destroy
  belongs_to :event

  accepts_nested_attributes_for :group_teams, :allow_destroy => true,
    :reject_if => proc { |a| a.all? { |k, v| v.blank? }}

  default_scope :order => 'name ASC'
end
