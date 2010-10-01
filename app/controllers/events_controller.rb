class EventsController < ApplicationController
  load_and_authorize_resource

  def admin
    @events = Event.all
  end

  def comment
    params[:comments]['user_id'] = current_user.id
    @comment = Event.find(params[:id]).comments.build(params[:comments])

    if @comment.save
      flash[:notice] = "Added your comment"
      redirect_to :action => "show", :id => params[:id]
    else
      flash[:alert] = "Could not add your comment"
      redirect_to :back
    end
  end

  def show
    @event = Event.find(params[:id])
    @event.increment!(:click_count)
    @editors = @event.event_editors.distinct
    @num_edits = @event.event_editors.count
    if @num_edits > 0
      @last_update = @event.event_editors.last.created_at
    else
      @last_update = @event.created_at
    end
  end

  def index
    if params[:category].blank? or params[:category] == 'all'
      @events = Event.search params[:search],
                              :page => params[:page],
                              :order => :start_date,
                              :sort_mode => :desc
    else
      if params[:search]
        @events = Event.search params[:search], 
                                :page => params[:page],
                                :order => :start_date,
                                :sort_mode => :desc,
                                :conditions => {:category_id => params[:category]}
      else
        @events = Event.paginate :page => params[:page], 
                                :conditions => {:category_id => params[:category]}
      end
    end

    respond_to do |format|
      format.html
      format.js { render :partial => @events }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new
    @event.groups.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])
    @event.user_id = current_user.id

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])
    @event.event_editors.create({:user_id => current_user.id})

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(admin_events_path) }
      format.xml  { head :ok }
    end
  end
end
