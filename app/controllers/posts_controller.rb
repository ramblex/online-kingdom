class PostsController < ApplicationController
  load_and_authorize_resource

  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @topic = Topic.find(params[:topic_id])
    @topic.update_attributes(:last_post_at => Time.now)
    @post = @topic.posts.build(params[:post])
    @post.user = current_user

    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to topic_url(@post.topic_id)
    else
      render :action => "new"
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      flash[:notice] = 'Post was successfully updated.'
      redirect_to topic_url(@post.topic_id)
    else
      render :action => "edit"
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
