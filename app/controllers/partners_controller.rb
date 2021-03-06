class PartnersController < ApplicationController
  load_and_authorize_resource
  uses_tiny_mce :options => AppConfig.default_mce_options, :only => [:new, :create, :edit, :update]

  def admin
    @partners = Partner.all
  end

  # GET /partners
  # GET /partners.xml
  def index
    @partners = Partner.prime

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @partners }
    end
  end

  # GET /partners/1
  # GET /partners/1.xml
  def show
    @partner = Partner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @partner }
    end
  end

  # GET /partners/new
  # GET /partners/new.xml
  def new
    @partner = Partner.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @partner }
    end
  end

  # GET /partners/1/edit
  def edit
    @partner = Partner.find(params[:id])
  end

  # POST /partners
  # POST /partners.xml
  def create
    @partner = Partner.new(params[:partner])

    respond_to do |format|
      if @partner.save
        flash[:notice] = 'Partner was successfully created.'
        format.html { redirect_to partners_url }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /partners/1
  # PUT /partners/1.xml
  def update
    @partner = Partner.find(params[:id])

    respond_to do |format|
      if @partner.update_attributes(params[:partner])
        flash[:notice] = 'Partner was successfully updated.'
        format.html { redirect_to partners_url }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /partners/1
  # DELETE /partners/1.xml
  def destroy
    @partner = Partner.find(params[:id])
    @partner.destroy

    respond_to do |format|
      format.html { redirect_to(partners_url) }
      format.xml  { head :ok }
    end
  end
end
