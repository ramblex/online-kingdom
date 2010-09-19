class FormatsController < ApplicationController
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
  end

  def update
  end

end
