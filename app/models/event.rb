class Event < ActiveRecord::Base
  has_many :matches
  belongs_to :category

  has_attached_file :logo, :styles => {:default => '61x24#'}
end
