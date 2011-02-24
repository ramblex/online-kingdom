class InsidersController < ApplicationController
  load_and_authorize_resource :except => :index
  uses_tiny_mce :options => AppConfig.default_mce_options, :only => [:edit, :update]

  # GET /insiders
  # GET /insiders.xml
  def index
    @insider = Insider.first
    @events = @insider.insider_events
    @files = @insider.insider_files

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @insiders }
    end
  end

  # GET /insiders/1/edit
  def edit
    @insider = Insider.find(params[:id])
  end

  # PUT /insiders/1
  # PUT /insiders/1.xml
  def update
    @insider = Insider.find(params[:id])

    respond_to do |format|
      if @insider.update_attributes(params[:insider])
        format.html { redirect_to(insiders_url, :notice => 'Insider was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /insiders/1
  # DELETE /insiders/1.xml
  def destroy
    @insider = Insider.find(params[:id])
    @insider.destroy

    respond_to do |format|
      format.html { redirect_to(insiders_url) }
      format.xml  { head :ok }
    end
  end
end
