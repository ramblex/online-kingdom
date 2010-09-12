class Match < ActiveRecord::Base
  belongs_to :team1, :class => 'Team', :foreign_key => 'team1_id'
  belongs_to :team2, :class => 'Team', :foreign_key => 'team2_id'
  belongs_to :category
  belongs_to :event
end
