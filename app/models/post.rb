class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  default_scope :order => 'created_at'

  named_scope :recent_posts, :order => 'created_at DESC', :limit => 10

  define_index do
    indexes content
  end
end
