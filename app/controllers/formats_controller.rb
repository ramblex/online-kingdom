class FormatsController < ApplicationController
  load_and_authorize_resource

  def index
    @formats = Format.all
  end

  def new
    @format = Format.new
  end

  def create
    @format = Format.new(params[:format])

    if @format.save
      flash[:notice] = 'Format was successfully saved'
      redirect_to :back
    else
      render :action => "new"
    end
  end

  def edit
    @format = Format.find(params[:id])
  end

  def update
    @format = Format.find(params[:id])

    if @format.update_attributes(params[:format])
      redirect_to formats_url
    else
      render :action => 'edit'
    end
  end

end
