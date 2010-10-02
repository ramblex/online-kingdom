class Insider < ActiveRecord::Base
  has_many :insider_events
  has_many :insider_files
  has_many :insider_prizes

  accepts_nested_attributes_for :insider_events, :allow_destroy => true
  accepts_nested_attributes_for :insider_files, :allow_destroy => true
  accepts_nested_attributes_for :insider_prizes, :allow_destroy => true
end
