module AlbumsHelper
  def add_photo_link
    link_to_function "Add another photo" do |page|
      page.insert_html :bottom, :new_photos, :partial => 'photo', :object => AlbumPhoto.new
    end
  end
end
