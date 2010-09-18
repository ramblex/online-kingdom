# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def flag(country_code)
    image_tag "/javascripts/tiny_mce/plugins/flags/img/#{country_code}.gif", :class => 'flag'
  end
end
