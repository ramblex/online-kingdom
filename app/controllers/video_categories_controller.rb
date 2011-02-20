class VideoCategoriesController < ApplicationController
  load_and_authorize_resource

  def create
    @video_category = VideoCategory.new(params[:video_category])

    respond_to do |format|
      if @video_category.save
        flash[:notice] = 'Video category was successfully created.'
        format.html { redirect_to(admin_video_categories_path) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def edit
    @video_category = VideoCategory.find(params[:id])
  end

  def update
    @video_category = VideoCategory.find(params[:id])

    if @video_category.update_attributes(params[:video_category])
      flash[:notice] = 'Updated video category'
      redirect_to admin_video_categories_path
    else
      render :action => 'edit'
    end
  end

  def admin
    @video_categories = VideoCategory.all
  end
end
