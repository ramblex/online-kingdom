class OkPlayer < ActiveRecord::Base
  has_attached_file :avatar, :styles => {
    :profile => "128x128"
  }, :default_url => '/images/default-user.png'
end
