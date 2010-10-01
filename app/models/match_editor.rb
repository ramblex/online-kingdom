class MatchEditor < ActiveRecord::Base
  belongs_to :match
  belongs_to :user
  named_scope :distinct, :select => 'distinct user_id'
end
