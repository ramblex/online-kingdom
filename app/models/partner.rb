class Partner < ActiveRecord::Base
  has_attached_file :logo, :styles => {
    :default => '155x155'
  }
  has_attached_file :white_logo, :styles => {
    :default => '155x155'
  }
end
