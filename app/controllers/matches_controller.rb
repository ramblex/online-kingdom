class MatchesController < ApplicationController
  load_and_authorize_resource
  uses_tiny_mce :only => [:new, :create, :edit, :update]

  def comment
    params[:comments]['user_id'] = current_user.id
    @comment = Match.find(params[:id]).comments.build(params[:comments])

    if @comment.save
      flash[:notice] = "Added your comment"
      redirect_to :action => "show", :id => params[:id]
    else
      flash[:alert] = "Could not add your comment"
      redirect_to :back
    end
  end


  def admin
    @matches = Match.all
  end

  # GET /matches
  # GET /matches.xml
  def index
    if params[:category].blank? or params[:category] == 'all'
      @matches = Match.search params[:search], :page => params[:page]
    else
      if params[:search]
        @matches = Match.search params[:search], :conditions => {:category_id => params[:category]}, :page => params[:page]
      else
        @matches = Match.paginate :page => params[:pages], :conditions => {:category_id => params[:category]}
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.js { render :partial => @matches }
    end
  end

  # GET /matches/1
  # GET /matches/1.xml
  def show
    @match = Match.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @match }
    end
  end

  # GET /matches/new
  # GET /matches/new.xml
  def new
    @match = Match.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @match }
    end
  end

  # GET /matches/1/edit
  def edit
    @match = Match.find(params[:id])
  end

  # POST /matches
  # POST /matches.xml
  def create
    @match = Match.new(params[:match])
    @match.user_id = current_user.id

    respond_to do |format|
      if @match.save
        flash[:notice] = 'Match was successfully created.'
        format.html { redirect_to(@match) }
        format.xml  { render :xml => @match, :status => :created, :location => @match }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @match.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /matches/1
  # PUT /matches/1.xml
  def update
    @match = Match.find(params[:id])

    respond_to do |format|
      if @match.update_attributes(params[:match])
        flash[:notice] = 'Match was successfully updated.'
        format.html { redirect_to(@match) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @match.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.xml
  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    respond_to do |format|
      format.html { redirect_to(matches_url) }
      format.xml  { head :ok }
    end
  end
end
