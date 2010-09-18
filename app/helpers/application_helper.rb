# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def flag(country_code)
    image_tag "/javascripts/tiny_mce/plugins/flags/img/#{country_code}.gif", :class => 'flag'
  end

  def country_name(country_code)
    # There's probably a better way of searching the array of countries
    ActionView::Helpers::FormOptionsHelper::COUNTRIES.each do |country|
      return country[0] if country[1].eql? country_code
    end
    return country_code
  end

  def admin_links(obj, extra_class = nil)
    html = %Q[ <div class="admin-links #{extra_class}"> ]
    if can? :edit, obj
      html << (link_to '[Edit]', :action => 'edit', :id => obj.id)
    end

    if can? :delete, obj
      html << ' '
      html << (link_to '[Delete]', {:id => obj.id, :method => :delete}, :confirm => 'Are you sure you want to delete this?')
    end

    html << '</div>'
  end
end
