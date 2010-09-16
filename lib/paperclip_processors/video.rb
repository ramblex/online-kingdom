module Paperclip
  class VideoThumbnail < Processor

    attr_accessor :time_offset, :geometry, :whiny

    def initialize(file, options = {}, attachment = nil)
      super
      @time_offset = options[:time_offset] || '-4'
      unless options[:geometry].nil? || (@geometry = Geometry.parse(options[:geometry])).nil?
        @geometry.width = (@geometry.width / 2.0).floor * 2.0
        @geometry.height = (@geometry.height / 2.0).floor * 2.0
        @geometry.modifier = ''
      end
      @whiny = options[:whiny].nil? ? true : options[:whiny]
      @basename = File.basename(file.path, File.extname(file.path))
    end

    def make
      dst = Tempfile.new([ @basename, 'jpg' ].compact.join("."))
      dst.binmode

      cmd = %Q[ -itsoffset #{time_offset} -i "#{File.expand_path(file.path)}" -y -vcodec mjpeg -vframes 1 -an -f rawvideo ]
      cmd << "-s #{geometry.to_s} " unless geometry.nil?
      cmd << %Q["#{File.expand_path(dst.path)}"]

      begin
        ffmpeg = %x[which ffmpeg].strip!
        ffmpeg << cmd
        success = Paperclip.run(ffmpeg)
      rescue PaperclipCommandLineError => e
        raise PaperclipError, "There was an error processing the thumbnail for #{@basename}: #{e.inspect}" if whiny
      end
      dst
    end
  end
end
