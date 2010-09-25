class OkPlayersController < ApplicationController
  load_and_authorize_resource

  # GET /ok_players
  # GET /ok_players.xml
  def index
    if params[:category].blank? or params[:category].eql? 'all'
      @ok_players = OkPlayer.paginate :page => params[:page]
    else
      @ok_players = OkPlayer.paginate :page => params[:page], :conditions => ['category_id = ?', params[:category]]
    end

    respond_to do |format|
      format.html # index.html.erb
      format.js  { render :partial => @ok_players }
    end
  end

  # GET /ok_players/1
  # GET /ok_players/1.xml
  def show
    @ok_player = OkPlayer.find(params[:id])
    redirect_to user_path(@ok_player.profile_num)
  end

  # GET /ok_players/new
  # GET /ok_players/new.xml
  def new
    @ok_player = OkPlayer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ok_player }
    end
  end

  # GET /ok_players/1/edit
  def edit
    @ok_player = OkPlayer.find(params[:id])
  end

  # POST /ok_players
  # POST /ok_players.xml
  def create
    @ok_player = OkPlayer.new(params[:ok_player])

    respond_to do |format|
      if @ok_player.save
        format.html { redirect_to(@ok_player, :notice => 'OkPlayer was successfully created.') }
        format.xml  { render :xml => @ok_player, :status => :created, :location => @ok_player }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ok_player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ok_players/1
  # PUT /ok_players/1.xml
  def update
    @ok_player = OkPlayer.find(params[:id])

    respond_to do |format|
      if @ok_player.update_attributes(params[:ok_player])
        format.html { redirect_to(@ok_player, :notice => 'OkPlayer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ok_player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ok_players/1
  # DELETE /ok_players/1.xml
  def destroy
    @ok_player = OkPlayer.find(params[:id])
    @ok_player.destroy

    respond_to do |format|
      format.html { redirect_to(ok_players_url) }
      format.xml  { head :ok }
    end
  end
end
