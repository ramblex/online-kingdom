class StreamsController < ApplicationController
  load_and_authorize_resource
  uses_tiny_mce :options => AppConfig.default_mce_options, :only => [:new, :create, :edit, :update]

  def admin
    @streams = Stream.all
  end

  # GET /streams
  # GET /streams.xml
  def index
    @ch1_stream = Stream.future.channel1.first
    @ch2_stream = Stream.future.channel2.first
    @ch1_next = Stream.next.future.channel1
    @ch2_next = Stream.next.future.channel2
    @advert1 = Advert.random('streams_1')
    @advert2 = Advert.random('streams_2')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @streams }
    end
  end

  # GET /streams/1
  # GET /streams/1.xml
  def show
    @stream = Stream.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stream }
    end
  end

  # GET /streams/new
  # GET /streams/new.xml
  def new
    @stream = Stream.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stream }
    end
  end

  # GET /streams/1/edit
  def edit
    @stream = Stream.find(params[:id])
  end

  # POST /streams
  # POST /streams.xml
  def create
    @stream = Stream.new(params[:stream])

    respond_to do |format|
      if @stream.save
        format.html { redirect_to(admin_streams_path, :notice => 'Stream was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /streams/1
  # PUT /streams/1.xml
  def update
    @stream = Stream.find(params[:id])

    respond_to do |format|
      if @stream.update_attributes(params[:stream])
        format.html { redirect_to(admin_streams_path, :notice => 'Stream was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /streams/1
  # DELETE /streams/1.xml
  def destroy
    @stream = Stream.find(params[:id])
    @stream.destroy

    respond_to do |format|
      format.html { redirect_to(admin_streams_path) }
      format.xml  { head :ok }
    end
  end
end
