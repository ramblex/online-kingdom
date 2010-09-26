class OkPlayer < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  named_scope :non_staff, :conditions => 'is_staff = 0'
  named_scope :staff, :conditions => 'is_staff = 1'
  named_scope :category, lambda {|x| {:conditions => ['category_id = ?', x]}}
  has_attached_file :avatar, :styles => {
    :profile => "128x128",
    :mini => "50x50"
  }, :default_url => '/images/default-user.png'
end
