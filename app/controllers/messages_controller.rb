class MessagesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @sent_messages = current_user.sent_messages
    @received_messages = current_user.received_messages
  end

  def show
    @message = Message.find(params[:id])

    # Mark receieved messages as shown
    if @message.receiver_id.eql? current_user.id
      @message.read = true
      @message.save
    end
  end

  def reply
    @parent = Message.find(params[:id])
    @message = Message.new({
      :title => 'Re: ' + @parent.title,
      :parent_id => @parent.id
    })
    @message.recipient = @parent.sender
  end

  def new
    @message = Message.new
    @valid_recipients = User.all :conditions => ['id != ?', current_user.id], :order => 'username ASC'
  end

  def create
    @message = Message.new(params[:message])
    @message.from_id = current_user.id
    unless @message.parent.nil?
      @message.recipient = @message.parent.sender
    end
    if @message.save
      flash[:notice] = "Successfully created message."
      redirect_to messages_path
    else
      if @message.parent.nil?
        render :action => 'new'
      else
        render :action => 'reply'
      end
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:notice] = "Successfully destroyed message."
    redirect_to messages_url
  end
end
