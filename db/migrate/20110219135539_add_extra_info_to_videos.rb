class AddExtraInfoToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :job_id, :string
    add_column :videos, :encoded_state, :string, :default => "unencoded"
    add_column :videos, :output_url, :string
    add_column :videos, :duration_in_ms, :integer
    add_column :videos, :aspect_ratio, :string
    add_column :videos, :thumbnail_file_name, :string
    add_column :videos, :thumbnail_content_type, :string
    add_column :videos, :thumbnail_file_size, :integer
    add_column :videos, :thumbnail_updated_at, :datetime
  end

  def self.down
    remove_column :videos, :thumbnail_updated_at
    remove_column :videos, :thumbnail_file_size
    remove_column :videos, :thumbnail_content_type
    remove_column :videos, :thumbnail_file_name
    remove_column :videos, :aspect_ratio
    remove_column :videos, :duration_in_ms
    remove_column :videos, :output_url
    remove_column :videos, :encoded_state
    remove_column :videos, :job_id
  end
end
