class Event < ActiveRecord::Base
  has_many :matches, :dependent => :destroy
  has_many :brackets, :dependent => :destroy
  has_many :groups, :dependent => :destroy
  belongs_to :category
  belongs_to :user
  belongs_to :format

  @@per_page = 10
  cattr_reader :per_page

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
