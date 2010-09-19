module ArticlesHelper
  def stars_for(article)
    html = '<div class="stars">'
    5.times.each_with_index do |idx, elem|
      if idx < article.rating
        html << (link_to '', rate_album_path(article.id, idx+1), :class => 'star filled', :id => idx + 1)
      else
        html << (link_to '', rate_album_path(article.id, idx+1), :class => 'star', :id => idx + 1)
      end
    end
    html << "</div>"
  end
end
