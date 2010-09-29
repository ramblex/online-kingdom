class NewsCategoriesController < ApplicationController
  load_and_authorize_resource

  def admin
    @news_categories = NewsCategory.all
  end

  # GET /news_categories/new
  # GET /news_categories/new.xml
  def new
    @news_category = NewsCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news_category }
    end
  end

  # GET /news_categories/1/edit
  def edit
    @news_category = NewsCategory.find(params[:id])
  end

  # POST /news_categories
  # POST /news_categories.xml
  def create
    @news_category = NewsCategory.new(params[:news_category])

    respond_to do |format|
      if @news_category.save
        format.html { redirect_to(admin_news_categories_path, :notice => 'NewsCategory was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /news_categories/1
  # PUT /news_categories/1.xml
  def update
    @news_category = NewsCategory.find(params[:id])

    respond_to do |format|
      if @news_category.update_attributes(params[:news_category])
        format.html { redirect_to(admin_news_categories_path, :notice => 'NewsCategory was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /news_categories/1
  # DELETE /news_categories/1.xml
  def destroy
    @news_category = NewsCategory.find(params[:id])
    @news_category.destroy

    respond_to do |format|
      format.html { redirect_to(admin_news_categories_url) }
      format.xml  { head :ok }
    end
  end
end
