class OkPlayer < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  named_scope :staff, :conditions => 'is_staff = 1'
  has_attached_file :avatar, :styles => {
    :profile => "128x128"
  }, :default_url => '/images/default-user.png'
end
