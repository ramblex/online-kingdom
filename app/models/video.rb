class Video < ActiveRecord::Base
  belongs_to :user
  has_attached_file :source,
                    :styles => {
                      :thumb => "120x90"
                    },
                    :url => '/system/:class/:id/:style.:content_type_extension',
                    :path => ':rails_root/public/system/:class/:id/:style.:content_type_extension',
                    :processors => lambda { |a| a.video? ? [ :video_thumbnail ] : [ :thumbnail ] }

  def video?
      [ 'application/x-mp4',
        'video/mpeg',
        'video/quicktime',
        'video/x-la-asf',
        'video/x-ms-asf',
        'video/x-msvideo',
        'video/x-sgi-movie',
        'video/x-flv',
        'flv-application/octet-stream',
        'video/3gpp',
        'video/3gpp2',
        'video/3gpp-tt',
        'video/BMPEG',
        'video/BT656',
        'video/CelB',
        'video/DV',
        'video/H261',
        'video/H263',
        'video/H263-1998',
        'video/H263-2000',
        'video/H264',
        'video/JPEG',
        'video/MJ2',
        'video/MP1S',
        'video/MP2P',
        'video/MP2T',
        'video/mp4',
        'video/MP4V-ES',
        'video/MPV',
        'video/mpeg4',
        'video/mpeg4-generic',
        'video/nv',
        'video/parityfec',
        'video/pointer',
        'video/raw',
        'video/rtx' ].include?(MIME::Types.type_for(source_file_name).to_s)
    end

protected
  def self.default_dimension
    '438x356'
  end

  def self.flvtool2_binary
    '/usr/bin/flvtool2'
  end

  def convert!
    Rails.logger.error('Converting video to flash')
    flv_file_path = File.join(File.dirname(source.path))
    %x[ffmpeg -i #{source.path} -b 1000000 -ar 22050 -ab 64 -f flv -y -s #{Video.default_dimension} #{flv_file_path}]
    %x[flvtool2 -U #{flv_file_path}}]
  end

end
