class MatchPlayer < ActiveRecord::Base
  belongs_to :player

  named_scope :team1, :conditions => {:team_id => 1}
  named_scope :team2, :conditions => {:team_id => 2}
end
