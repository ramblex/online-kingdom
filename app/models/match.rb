class Match < ActiveRecord::Base
  default_scope :order => 'created_at DESC'

  belongs_to :team1, :class_name => 'Team', :foreign_key => 'team1_id'
  belongs_to :team2, :class_name => 'Team', :foreign_key => 'team2_id'
  belongs_to :category
  belongs_to :event
  belongs_to :user
  belongs_to :format

  has_attached_file :map_picture, :styles => {:default => '200x100'}

  validates_presence_of :team1, :team2, :category, :event, :start_date

  def has_happened
    start_date < DateTime.now
  end
end
