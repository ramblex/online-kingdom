class Event < ActiveRecord::Base
  has_many :matches
  has_many :event_teams
  belongs_to :category
  belongs_to :user

  has_many :attending_teams, :class_name => 'EventTeam', :select => 'DISTINCT team_id', :conditions => 'team_id IS NOT NULL'

  accepts_nested_attributes_for :event_teams

  has_attached_file :logo, :styles => {:default => '61x24#'}
end
