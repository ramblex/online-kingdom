class Video < ActiveRecord::Base
  belongs_to :user
  named_scope :finished, :conditions => { :encoded_state => "finished" }

  def encode!(options = {})
    begin
      zen = Zencoder.new(zencoder_settings["settings"]["base_url"], zencoder_settings["settings"]["notification_url"])
      if zen.encode('/'+self.source_file_name, 800, 450, "/thumbnails_#{self.id}", options)
        self.encoded_state = "queued"
        self.output_url = zen.output_url
        self.job_id = zen.job_id
        self.save
      else
        errors.add_to_base(zen.errors)
        return nil
      end
    rescue RuntimeError => exception
      errors.add_to_base("Video encoding request failed with result: " + exception.to_s)
      return nil
    end
  end

  def poster
     zencoder_settings["settings"]["thumb_base_url"] + "/thumbnails_#{self.id}/poster_0000.png"
  end

  def thumbnail
     zencoder_settings["settings"]["thumb_base_url"] + "/thumbnails_#{self.id}/thumbnail_0000.png"
  end

  def capture_notification(output)
    self.encoded_state = output[:state]
    if self.encoded_state == "finished"
      self.output_url = output[:url]
    end
    self.save
  end

  private
    def zencoder_settings
      @zencoder_config ||= YAML.load_file("#{RAILS_ROOT}/config/zencoder.yml")
    end
end
