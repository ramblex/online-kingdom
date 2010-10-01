class EventEditor < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  named_scope :distinct, :select => 'DISTINCT user_id'
end
