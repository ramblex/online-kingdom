class Stream < ActiveRecord::Base
  belongs_to :event
  belongs_to :category
  named_scope :future, :conditions => ['on_at > ?', DateTime.now]
  named_scope :next, :offset => 1
  named_scope :channel1, :conditions => ['channel = ?', 'CHANNEL ONE'], :limit => 6
  named_scope :channel2, :conditions => ['channel = ?', 'CHANNEL TWO'], :limit => 6
end
