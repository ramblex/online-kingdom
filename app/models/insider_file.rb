class InsiderFile < ActiveRecord::Base
  has_attached_file :file,
                    :url => '/:class/:id/:style.:extension',
                    :path => ':rails_root/assets/:class/:id_partition/:style.:extension'

  before_post_process :image?

  def downloadable?(user)
    user.is? :insider or user.is? :admin
  end

  def image?
    !(file_content_type =~ /^image.*/).nil?
  end
end
