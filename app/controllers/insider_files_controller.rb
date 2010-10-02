class InsiderFilesController < ApplicationController
  def download
    head(:not_found) and return if (dl = InsiderFile.find(params[:id])).nil?
    head(:forbidden) and return unless dl.downloadable?(current_user)

    path = dl.file.path(params[:style])
    head(:bad_request) and return unless File.exist?(path) && params[:format].to_s == File.extname(path).gsub(/^\.+/, '')

    send_file_options = { :type => dl.file.content_type }
    send_file_options[:x_sendfile] = true
    send_file(path, send_file_options)
  end
end
