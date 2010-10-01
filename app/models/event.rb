class Event < ActiveRecord::Base
  has_many :matches, :dependent => :destroy
  has_many :brackets, :dependent => :destroy
  has_many :groups, :dependent => :destroy
  has_many :event_editors, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  belongs_to :category
  belongs_to :user
  belongs_to :format

  @@per_page = 10
  cattr_reader :per_page

  default_scope :order => 'start_date DESC'

  #has_many :attending_teams, :class_name => 'EventTeam', :select => 'DISTINCT team_id', :conditions => 'team_id IS NOT NULL'

  def attending_teams
    teams = []
    if has_brackets
      teams += EventTeam.find_by_sql(['SELECT distinct event_teams.team_id
                              FROM brackets, event_teams
                              WHERE brackets.event_id = ?
                              AND event_teams.bracket_id = brackets.id
                              AND event_teams.team_id is not null', id]).map do |event_team|
        event_team.team
      end
    end

    if has_groups
      teams += GroupTeam.find_by_sql(['SELECT distinct group_teams.team_id
                              FROM groups, group_teams
                              WHERE groups.event_id = ?
                              AND group_teams.group_id = groups.id', id]).map do |group_team|
        group_team.team
      end
    end
    teams.uniq!
    teams ||= []
  end

  def type
    if team_event
      'team'
    else
      'player'
    end
  end

  has_attached_file :logo, :styles => {:default => '61x24#'}
  has_attached_file :large_logo, :styles => {:default => '130x130'}, :default_style => :default

  define_index do
    indexes name
    indexes start_date, :sortable => true
    indexes category_id
    indexes category.name
  end
end
