class CommentsController < ApplicationController
  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Updated comment"
      if @comment.article_id?
        redirect_to @comment.article
      elsif @comment.album_id?
        redirect_to @comment.album
      end
    else
      flash[:alert] = 'Could not update comment'
      redirect_to :action => 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end
end
