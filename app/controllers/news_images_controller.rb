class NewsImagesController < ApplicationController
  def index
    @news_images = NewsImage.all
    render :layout => false
  end
end
