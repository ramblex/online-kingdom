class ArticleSweeper < ActionController::Caching::Sweeper
  observe Article, Match, Video, Album, Post

  def after_save(article)
    expire_cache(article)
  end

  def after_destory(article)
    expire_cache(article)
  end

  def expire_cache(article)
    expire_page :controller => 'articles', :action => 'home'
  end
end
