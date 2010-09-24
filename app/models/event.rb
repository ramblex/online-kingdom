class Event < ActiveRecord::Base
  has_many :matches, :dependent => :destroy
  has_many :brackets
  has_many :groups
  belongs_to :category
  belongs_to :user

  #has_many :attending_teams, :class_name => 'EventTeam', :select => 'DISTINCT team_id', :conditions => 'team_id IS NOT NULL'

  has_attached_file :logo, :styles => {:default => '61x24#'}
end
