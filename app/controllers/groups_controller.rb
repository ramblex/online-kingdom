class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.xml
  def index
    @event = Event.find(params[:event_id])
    @groups = @event.groups

    respond_to do |format|
      format.html # index.html.erb
      format.js { render :partial => 'group_select', :locals => {:groups => @groups}}
    end
  end

  # GET /groups/1
  # GET /groups/1.xml
  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.js { render :partial => @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.xml
  def new
    @event = Event.find(params[:event_id])
    @group = @event.groups.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.xml
  def create
    @event = Event.find(params[:event_id])
    @group = @event.groups.build(params[:group])

    if @group.save
      redirect_to(@event, :notice => 'Group was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /groups/1
  # PUT /groups/1.xml
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to(@group, :notice => 'Group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.xml
  def destroy
    @group = Group.find(params[:id])
    @event = @group.event
    @group.destroy

    respond_to do |format|
      format.html { redirect_to event_groups_path(@event) }
      format.xml  { head :ok }
    end
  end
end
