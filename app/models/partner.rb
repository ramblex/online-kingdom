class Partner < ActiveRecord::Base
  named_scope :official_partners, :conditions => ['prime = 0']
  named_scope :prime, :conditions => :prime

  has_attached_file :logo, :styles => {
    :default => '155x155',
    :official => '150x80'
  }
  has_attached_file :white_logo, :styles => {
    :default => '155x155'
  }
end
