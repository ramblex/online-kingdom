class Event < ActiveRecord::Base
  has_many :matches
  has_many :event_teams
  belongs_to :category

  accepts_nested_attributes_for :event_teams, :allow_destroy => true,
    :reject_if => proc { |attributes| attributes.all? {|k,v| v.blank?}}

  has_attached_file :logo, :styles => {:default => '61x24#'}
end
