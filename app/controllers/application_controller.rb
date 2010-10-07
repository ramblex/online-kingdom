# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/unauth'
  end

  def search_all(model)
    if params[:category].blank? or params[:category] == 'all'
      if params[:search]
        return model.search params[:search],
                                :page => params[:page],
                                :order => :start_date,
                                :sort_mode => :desc
      else
        return model.paginate :page => params[:page]
      end
    else
      if params[:search]
        return model.search params[:search],
                            :page => params[:page],
                            :order => :start_date,
                            :sort_mode => :desc,
                            :conditions => {:category_id => params[:category]}
      else
       return model.paginate :page => params[:page],
                             :conditions => {:category_id => params[:category]}
      end
    end
  end
end
