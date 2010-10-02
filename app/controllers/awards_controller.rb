class AwardsController < ApplicationController
  load_and_authorize_resource
  uses_tiny_mce :only => [:new, :create, :edit, :update]

  def admin
    @awards = Award.all
  end

  # GET /awards
  # GET /awards.xml
  def index
    if params[:category].nil? or params[:category] == 'all'
      @awards = Award.all
    else
      @awards = Award.all :conditions => {:category_id => params[:category]}
    end

    respond_to do |format|
      format.html # index.html.erb
      format.js { render :partial => @awards }
    end
  end

  # GET /awards/1
  # GET /awards/1.xml
  def show
    @award = Award.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @award }
    end
  end

  # GET /awards/new
  # GET /awards/new.xml
  def new
    @award = Award.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @award }
    end
  end

  # GET /awards/1/edit
  def edit
    @award = Award.find(params[:id])
  end

  # POST /awards
  # POST /awards.xml
  def create
    @award = Award.new(params[:award])

    respond_to do |format|
      if @award.save
        flash[:notice] = 'Award was successfully created.'
        format.html { redirect_to awards_path }
        format.xml  { render :xml => @award, :status => :created, :location => @award }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @award.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /awards/1
  # PUT /awards/1.xml
  def update
    @award = Award.find(params[:id])

    respond_to do |format|
      if @award.update_attributes(params[:award])
        flash[:notice] = 'Award was successfully updated.'
        format.html { redirect_to(awards_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @award.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /awards/1
  # DELETE /awards/1.xml
  def destroy
    @award = Award.find(params[:id])
    @award.destroy

    respond_to do |format|
      format.html { redirect_to(awards_url) }
      format.xml  { head :ok }
    end
  end
end
