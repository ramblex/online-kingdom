class Manager < ActiveRecord::Base
  belongs_to :user
  named_scope :high_management, :conditions => :is_high_management
  named_scope :medium_management, :conditions => ['is_high_management = 0']
  has_attached_file :avatar, :styles => {:default => '120x120', :mini => '50x50'},
    :default_style => :default,
    :default_url => '/images/default-user.png'
end
