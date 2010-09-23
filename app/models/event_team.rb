class EventTeam < ActiveRecord::Base
  belongs_to :team
  belongs_to :event

  default_scope :order => 'position ASC'
end
