class AlbumsController < ApplicationController
  load_and_authorize_resource

  def comment
    params[:comments]['user_id'] = current_user.id
    @comment = Album.find(params[:id]).comments.build(params[:comments])

    if @comment.save
      flash[:notice] = "Added your comment"
    else
      flash[:alert] = "Could not add your comment"
    end
    redirect_to :action => "show", :id => params[:id]
  end

  # Enable users to rate a given article
  # /articles/1/rate/4
  def rate
    @album = Album.find(params[:id])
    authorize! :rate, @album
    @album_rating = AlbumRating.new({
      :user_id => current_user.id,
      :album_id => params[:id],
      :rating => params[:rating]
    })

    if @album_rating.save
      flash[:notice] = 'Thanks for rating'
    else
      flash[:alert] = "Could not save your rating. You may have rated this already!"
    end

    redirect_to :back
  end


  # GET /albums
  # GET /albums.xml
  def index
    if params[:search].blank?
      @albums = Album.all
    else
      @albums = Album.search params[:search]
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.xml
  def show
    @album = Album.find(params[:id])
    @album.increment!(:click_count)

    respond_to do |format|
      format.html # show.html.erb
      format.js
    end
  end

  # GET /albums/new
  # GET /albums/new.xml
  def new
    @album = Album.new
    @album.album_photos.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @album }
    end
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
  end

  # POST /albums
  # POST /albums.xml
  def create
    @album = Album.new(params[:album])
    @album.user_id = current_user.id

    respond_to do |format|
      if @album.save
        flash[:notice] = 'Album was successfully created.'
        format.html { redirect_to(@album) }
        format.xml  { render :xml => @album, :status => :created, :location => @album }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.xml
  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        flash[:notice] = 'Album was successfully updated.'
        format.html { redirect_to(@album) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.xml
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to(albums_url) }
      format.xml  { head :ok }
    end
  end
end
