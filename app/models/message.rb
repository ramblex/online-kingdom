class Message < ActiveRecord::Base
  belongs_to :recipient, :class_name => 'User', :foreign_key => 'receiver_id'
  belongs_to :sender, :class_name => 'User', :foreign_key => 'from_id'
  attr_accessible :receiver_id, :title, :content, :parent_id

  acts_as_tree :order => 'created_at ASC'

  validates_presence_of :recipient, :title, :content, :from_id

  named_scope :unread, :conditions => {:read => false}
end
