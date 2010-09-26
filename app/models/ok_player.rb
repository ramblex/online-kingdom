class OkPlayer < ActiveRecord::Base
  belongs_to :category
  has_attached_file :avatar, :styles => {
    :profile => "128x128"
  }, :default_url => '/images/default-user.png'
end
