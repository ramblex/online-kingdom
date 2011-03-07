class NewsImagesController < ApplicationController
  def index
    @news_images = NewsImage.paginate :page => params[:page], :order => 'id DESC'
    @news_image = NewsImage.new
    render :layout => false
  end

  def create
    @news_image = NewsImage.new(params[:news_image])
    if @news_image.save
      render :partial => @news_image
    else
      render :partial => 'form', :layout => false
    end
  end

  def destroy
    @news_image = NewsImage.find(params[:id])
    @news_image.destroy
  end
end
