class Player < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
  belongs_to :category

  default_scope :order => 'nickname ASC'

  validates_presence_of :nickname

  has_attached_file :avatar, :styles => {:default => "100x100#", :mini => "50x50#"},
    :default_url => '/images/default-user.png',
    :default_style => :default

  # In order to accommodate events for individual players, automatically create a team
  # for each player.
  after_create :create_team
  after_update :update_team

private
  def create_team
    Team.create({
      :player_id => id,
      :name => nickname,
      :category_id => category_id,
      :user_id => user_id,
      :country => country
    })
  end

  def update_team
    Team.find_by_player_id(id).update_attributes({
      :name => nickname,
      :category_id => category_id,
      :user_id => user_id,
      :country => country
    })
  end
end
