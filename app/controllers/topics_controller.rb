class TopicsController < ApplicationController
  load_and_authorize_resource

  def lock
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(:locked => true)
      flash[:notice] = "Locked topic"
    else
      flash[:alert] = "Could not lock topic"
    end
    redirect_to :back
  end

  def unlock
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(:locked => false)
      flash[:notice] = "Unlocked topic"
    else
      flash[:alert] = "topic"
    end
    redirect_to :back
  end

  # GET /topics
  # GET /topics.xml
  def index
    @topics = Topic.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @topics }
    end
  end

  def reply
    topic = Topic.find(params[:id])
    if topic.locked
      flash[:alert] = "Topic is locked."
      redirect_to :action => "show", :id => params[:id]
    else
      topic.posts.create(params[:post])
      flash[:notice] = "Posted reply"
      redirect_to :action => "show", :id => params[:id]
    end
  end

  # GET /topics/1
  # GET /topics/1.xml
  def show
    @topic = Topic.find(params[:id])
    @post = Post.new

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.xml
  def new
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.build
    @topic.posts.build
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
  end

  # POST /topics
  # POST /topics.xml
  def create
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.build(params[:topic])
    @topic.last_post_at = DateTime.now
    @topic.user = current_user
    @topic.last_poster = current_user
    @topic.posts.first.user = current_user

    if @topic.save
      flash[:notice] = 'Topic was successfully created.'
      redirect_to forum_url(@topic.forum_id)
    else
      render :action => "new"
    end
  end

  # PUT /topics/1
  # PUT /topics/1.xml
  def update
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        flash[:notice] = 'Topic was successfully updated.'
        format.html { redirect_to(@topic) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.xml
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to(topics_url) }
      format.xml  { head :ok }
    end
  end
end
