class Team < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :players
  has_many :team1_matches, :class_name => 'Match', :foreign_key => 'team1_id'
  has_many :team2_matches, :class_name => 'Match', :foreign_key => 'team2_id'

  def matches
    team1_matches + team2_matches
  end

  has_attached_file :logo, :styles => { :default => '100x100#' }
end
