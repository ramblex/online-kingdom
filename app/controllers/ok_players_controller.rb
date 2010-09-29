class OkPlayersController < ApplicationController
  load_and_authorize_resource

  def admin
    @ok_players = OkPlayer.all
  end

  # GET /ok_players
  # GET /ok_players.xml
  def index
    if params[:category].blank? or params[:category].eql? 'all'
      @ok_players = OkPlayer.non_staff
      @ok_staff = OkPlayer.staff
      @ok_matches = []
      Category.all.each do |category|
        @ok_matches += category.ok_team.matches if category.ok_team and @ok_matches.size < 15
      end
      @ok_matches = @ok_matches.sort_by(&:start_date).reverse[0..14]
    else
      @ok_players = OkPlayer.non_staff.category(params[:category])
      @ok_staff = OkPlayer.staff.category(params[:category])
      category = Category.find(params[:category])
      @ok_matches = category.ok_team.matches.sort_by(&:start_date)[0..14] if category.ok_team
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

    if @ok_player.save
      flash[:notice] = 'Created OK player'
      redirect_to ok_players_path
    else
      render :action => 'new'
    end
  end

  # PUT /ok_players/1
  # PUT /ok_players/1.xml
  def update
    @ok_player = OkPlayer.find(params[:id])

    if @ok_player.update_attributes(params[:ok_player])
      redirect_to(ok_players_url, :notice => 'OkPlayer was successfully updated.')
    else
      render :action => "edit"
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
