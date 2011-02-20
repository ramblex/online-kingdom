class VideosController < ApplicationController
  load_and_authorize_resource :except => :encode_notify

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
    if params[:video_category].nil? or params[:video_category].eql? 'all'
      @videos = Video.all
    else
      @videos = Video.find_by_video_category_id(params[:video_category])
    end
    @advert = Advert.random('videos_list')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @videos }
    end
  end

  def comment
    @comment = Video.find(params[:id]).comments.build(params[:comments])
    @comment.user_id = current_user.id

    if @comment.save
      flash[:notice] = "Added your comment"
      redirect_to :action => 'show', :id => params[:id]
    else
      flash[:alert] = "Could not add your comment"
      redirect_to :back
    end
  end

  def show
    @video = Video.find(params[:id])
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
