module AlbumsHelper
  def add_photo_link
    link_to_function "Add another photo" do |page|
      page.insert_html :bottom, :new_photos, :partial => 'photo', :object => AlbumPhoto.new
    end
  end

  def stars_for(album)
    html = '<div class="stars">'
    5.times.each_with_index do |idx, elem|
      if idx < album.rating
        html << (link_to '', rate_path(album.id, idx+1), :class => 'star filled', :id => idx + 1)
      else
        html << (link_to '', rate_path(album.id, idx+1), :class => 'star', :id => idx + 1)
      end
    end
    html << "</div>"
  end
end
