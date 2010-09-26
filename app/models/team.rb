class Team < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :player
  has_many :players
  has_many :team1_matches, :class_name => 'Match', :foreign_key => 'team1_id'
  has_many :team2_matches, :class_name => 'Match', :foreign_key => 'team2_id'
  named_scope :team_teams, :conditions => ['player_id IS NULL'], :order => 'name ASC'
  named_scope :player_teams, :conditions => ['player_id IS NOT NULL'], :order => 'name ASC'

  def matches
    team1_matches + team2_matches
  end

  def won
    team1_matches.team1_wins.happened + team2_matches.team2_wins.happened
  end

  def drawn
    team1_matches.happened.drawn + team2_matches.happened.drawn
  end

  def lost
    team1_matches.happened.team2_wins + team2_matches.happened.team1_wins
  end

  has_attached_file :logo, :styles => { :default => '100x100#' }
end
