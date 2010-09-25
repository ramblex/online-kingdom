class Event < ActiveRecord::Base
  # if team_event is false then we assume that the event is for single players

  has_many :matches, :dependent => :destroy
  has_many :brackets, :dependent => :destroy
  has_many :groups, :dependent => :destroy
  belongs_to :category
  belongs_to :user
  belongs_to :format

  #has_many :attending_teams, :class_name => 'EventTeam', :select => 'DISTINCT team_id', :conditions => 'team_id IS NOT NULL'

  def type
    if team_event
      'team'
    else
      'player'
    end
  end

  has_attached_file :logo, :styles => {:default => '61x24#'}
end
