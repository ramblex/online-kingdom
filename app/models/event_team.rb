class EventTeam < ActiveRecord::Base
  belongs_to :team
  belongs_to :event
  belongs_to :match

  default_scope :order => 'position ASC'
end
