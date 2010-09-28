class ArticlesController < ApplicationController
  load_and_authorize_resource
  uses_tiny_mce :only => [:new, :create, :edit, :update, :show]

  # Home page - may be worth putting this in a separate controller but that seems
  # overkill for now.
  def home
    if params[:match_category].blank? or params[:match_category].downcase.eql? 'all'
      @matches = Match.all :limit => 15
    else
      @matches = Match.all :limit => 15, :conditions => ['category_id = ?', params[:match_category]]
    end

    if params[:category].blank? or params[:category].downcase.eql? 'all'
      @articles = Article.approved :limit => 5
    else
      @articles = Article.approved :limit => 5, :conditions => ['category_id = ?', params[:category]]
    end

    @blogs = Blog.all :limit => 5
  end

  def admin
    @articles = Article.all
  end

  def comment
    params[:article_comments]['user_id'] = current_user.id
    Article.find(params[:id]).article_comments.create(params[:article_comments])
    flash[:notice] = "Added your comment"
    redirect_to :action => "show", :id => params[:id]
  end

  # Enable users to rate a given article
  # /articles/1/rate/4
  def rate
    @article = Article.find(params[:id])
    authorize! :rate, @article
    @article_rating = ArticleRating.new({
      :user_id => current_user.id,
      :article_id => params[:id],
      :rating => params[:rating]
    })

    if @article_rating.save
      flash[:notice] = 'Thanks for rating'
    else
      flash[:alert] = "Could not save your rating. You may have rated this already!"
    end

    redirect_to :back
  end

  # GET /articles
  # GET /articles.xml
  def index
    if params[:category].blank? or params[:category].eql? 'all'
      @articles = Article.approved.paginate :page => params[:page]
    else
      @articles = Article.approved.paginate :page => params[:page], :conditions => ['category_id = ?', params[:category]]
    end

    respond_to do |format|
      format.html # index.html.erb
      format.js { render :partial => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new
    @categories = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id

    if @article.approved
      @article.moderator_id = current_user.id
    end

    respond_to do |format|
      if @article.save
        flash[:notice] = 'Article was successfully created.'
        format.html { redirect_to(@article) }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])
    @article.moderator_id = current_user.id

    respond_to do |format|
      if @article.update_attributes(params[:article])
        flash[:notice] = 'Article was successfully updated.'
        format.html { redirect_to(@article) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end
end
