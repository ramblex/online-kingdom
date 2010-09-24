class BracketsController < ApplicationController
  # GET /brackets
  # GET /brackets.xml
  def index
    @event = Event.find(params[:event_id])
    @brackets = @event.brackets


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @brackets }
    end
  end

  # GET /brackets/1
  # GET /brackets/1.xml
  def show
    @bracket = Bracket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bracket }
    end
  end

  # GET /brackets/new
  # GET /brackets/new.xml
  def new
    @event = Event.find(params[:event_id])
    @bracket = @event.brackets.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bracket }
    end
  end

  # GET /brackets/1/edit
  def edit
    @bracket = Bracket.find(params[:id])
  end

  # POST /brackets
  # POST /brackets.xml
  def create
    @event = Event.find(params[:event_id])
    @bracket = @event.brackets.build(params[:bracket])

    if @bracket.save
      redirect_to(@event, :notice => 'Bracket was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /brackets/1
  # PUT /brackets/1.xml
  def update
    @bracket = Bracket.find(params[:id])

    if @bracket.update_attributes(params[:bracket])
      redirect_to(@bracket.event, :notice => 'Bracket was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /brackets/1
  # DELETE /brackets/1.xml
  def destroy
    @bracket = Bracket.find(params[:id])
    @bracket.destroy

    respond_to do |format|
      format.html { redirect_to(brackets_url) }
      format.xml  { head :ok }
    end
  end
end
