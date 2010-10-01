class InsiderFile < ActiveRecord::Base
  has_attached_file :file

  before_post_process :image?

  def image?
    !(file_content_type =~ /^image.*/).nil?
  end
end
