class EventTeam < ActiveRecord::Base
  belongs_to :team
  belongs_to :event
end
