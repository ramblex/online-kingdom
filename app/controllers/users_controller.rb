class UsersController < ApplicationController
  load_and_authorize_resource
  uses_tiny_mce :options => AppConfig.default_mce_options, :only => [:new, :create, :edit, :update, :show]

  def index
    @users = User.search(params[:q]).paginate :page => params[:page]
    @num_users = User.count
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated'
        format.html { redirect_to :back }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
  end
end
