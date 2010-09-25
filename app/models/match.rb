class Match < ActiveRecord::Base
  default_scope :order => 'start_date DESC'

  belongs_to :team1, :class_name => 'Team', :foreign_key => 'team1_id'
  belongs_to :team2, :class_name => 'Team', :foreign_key => 'team2_id'
  belongs_to :category
  belongs_to :event
  belongs_to :user
  belongs_to :format

  has_many :event_teams

  named_scope :team1_wins, :conditions => 'team1_score > team2_score'
  named_scope :team2_wins, :conditions => 'team1_score < team2_score'
  named_scope :drawn, :conditions => 'team1_score = team2_score'

  named_scope :happened, :conditions => 'start_date < NOW()'

  has_attached_file :map_picture, :styles => {:default => '200x100'}

  validates_presence_of :team1, :team2, :category, :event, :start_date

  def has_happened
    start_date < DateTime.now
  end

  after_update :update_event_teams

  # If we update an event match, make sure that the corresponding match in a bracket is
  # updated
  def update_event_teams
    if event_teams.size == 2
      event_teams[0].update_attributes({:team_id => self.team1.id})
      event_teams[1].update_attributes({:team_id => self.team2.id})
    end
  end
end
