class VideosController < ApplicationController
  before_filter :authenticate_user!, :except => [:encode_notify]

  def encode_notify
    video = Video.find_by_job_id(params[:job][:id].to_i)
    video.capture_notification(params[:output]) if video
    render :text => "Thanks, Zencoder!", :status => 200
  end

  def admin
    @videos = Video.all
  end

  # GET /videos
  # GET /videos.xml
  def index
    @videos = Video.all
    @advert = Advert.random('videos_list')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @videos }
    end
  end

  # GET /videos/new
  # GET /videos/new.xml
  def new
    @video = Video.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @video }
    end
  end

  # GET /videos/1/edit
  def edit
    @video = Video.find(params[:id])
  end

  # POST /videos
  # POST /videos.xml
  def create
    @video = Video.new(params[:video])
    @video.user_id = current_user.id

    respond_to do |format|
      if @video.save && @video.encode!({:test => 1})
        format.html { redirect_to admin_videos_path, :notice => "Video created. Encoding has started" }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /videos/1
  # PUT /videos/1.xml
  def update
    @video = Video.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:video])
        flash[:notice] = 'Video was successfully updated.'
        format.html { redirect_to(@video) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @video.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.xml
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to(admin_videos_url) }
      format.xml  { head :ok }
    end
  end
end
