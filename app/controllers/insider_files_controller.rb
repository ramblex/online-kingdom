class InsiderFilesController < ApplicationController
  def download
    head(:not_found) and return if (dl = InsiderFile.find(params[:id])).nil?
    head(:forbidden) and return unless dl.downloadable?(current_user)

    path = dl.file.path(params[:style])
    Rails.logger.error(path)
    head(:not_found) and return unless File.exist?(path)
    head(:bad_request) and return unless params[:format].to_s == File.extname(path).gsub(/^\.+/, '')

    send_file path
  end
end
