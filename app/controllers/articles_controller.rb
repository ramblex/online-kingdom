class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show, :home]
  load_and_authorize_resource
  uses_tiny_mce :options => AppConfig.default_mce_options, :only => [:new, :create, :edit, :update, :show]


  # Home page - may be worth putting this in a separate controller but that seems
  # overkill for now.
  def home
    params[:lang] ||= 'English'
    if params[:category].blank? or params[:category].downcase.eql? 'all'
      @matches = Match.homepage
    else
      @matches = Match.homepage.category(params[:category])
    end

    if params[:news_category].blank? or params[:news_category].downcase.eql? 'all'
      @articles = Article.approved.front_page.get_lang(params[:lang]).news_category(NewsCategory.first.id)
    else
      @articles = Article.approved.front_page.get_lang(params[:lang]).news_category(params[:news_category])
    end

    @momentnews = Article.approved.get_lang(params[:lang]).news_of_the_moment
    @blogs = Blog.all :limit => 5, :include => [:user, :slug]
    if params[:video_category].nil? or params[:video_category].eql? 'all'
      @videos = Video.all :limit => 3, :include => :user
    else
      @videos = Video.find_by_video_category_id(params[:video_category], :limit => 3, :include => :user)
    end
    @albums = Album.all :limit => 6, :include => :user, :order => 'created_at DESC'
    @advert = Advert.random('main_page')
    @latest_posts = Post.all :limit => 12, :order => 'updated_at DESC'
  end

  def admin
    @articles = Article.all
  end

  def comment
    @comment = Article.find(params[:id]).comments.build(params[:comments])
    @comment.user_id = current_user.id

    if @comment.save
      flash[:notice] = "Added your comment"
      redirect_to :action => "show", :id => params[:id]
    else
      flash[:alert] = "Could not add your comment"
      redirect_to :back
    end
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
    params[:lang] ||= 'English'
    unless read_fragment({:page => params[:page] || 1,
                          :category => params[:category] || 'all',
                          :lang => params[:lang] || 'English'})
      if params[:category].blank? or params[:category].eql? 'all'
        @articles = Article.approved.published.with_related.get_lang(params[:lang]).paginate :page => params[:page]
      else
        @articles = Article.approved.published.with_related.get_lang(params[:lang]).paginate :page => params[:page], :conditions => ['category_id = ?', params[:category]]
      end
    end
  end

  def unapproved
  end

  def publish
    @article = Article.find(params[:id])
    @article.update_attributes({:published => true})
    if @article.save
      if @article.approved
        flash[:notice] = "Article has been published."
      else
        flash[:notice] = "Article has been published. It still needs approval."
      end
      redirect_to @article
    else
      flash[:alert] = "Could not publish the article. Please try again."
      redirect_to :back
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])
    if !@article.approved and @article.published
      redirect_to :action => 'unapproved'
    else
      @article.increment!(:click_count)
      @editors = @article.article_editors.distinct
      @num_edits = @article.article_editors.size
      if @num_edits > 0
        @last_update = @article.article_editors.last.created_at
      else
        @last_update = @article.created_at
      end

      @advert = Advert.random('news_articles')
      fresh_when :last_modified => @article.updated_at.utc, :etag => @article
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

    #if @article.approved
      #@article.article_editors.create({:user_id => current_user.id})
    #end

    respond_to do |format|
      if @article.save
        flash[:notice] = 'Article was successfully created.'
        format.html { redirect_to(@article) }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
        expire_fragment :action => 'index', :action_suffix => 'all_articles'
        expire_fragment :action_suffix => 'top_article'
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
    # Don't add editors until the article is published
    if @article.published
      if !@article.approved and params[:article][:approved]
        editor = @article.article_editors.create({:user_id => current_user.id, :update_type => 'Edited/Approved'})
      else
        editor = @article.article_editors.create({:user_id => current_user.id, :update_type => 'Edited'})
      end
    end

    respond_to do |format|
      if @article.update_attributes(params[:article])
        flash[:notice] = 'Article was successfully updated.'
        format.html { redirect_to(@article) }
        format.xml  { head :ok }
        expire_fragment :action => 'index', :action_suffix => 'all_articles'
        expire_fragment :action_suffix => 'top_article'
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
    expire_fragment :action => 'index', :action_suffix => 'all_articles'
    expire_fragment :action_suffix => 'top_article'
  end
end
