class Category < ActiveRecord::Base
  has_many :articles, :dependent => :nullify
  has_many :teams, :dependent => :nullify
  belongs_to :ok_team, :class_name => 'Team', :foreign_key => 'ok_team_id'

  validates_presence_of :name, :long_name

  has_attached_file :small_icon, :styles => {:default => '25x15'},
    :default_url => '/images/default-category.gif'
end
