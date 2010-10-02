# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def flag(country_code)
    image_tag "/javascripts/tiny_mce/plugins/flags/img/#{country_code}.gif", :class => 'flag'
  end

  def event_category_teams(event)
    if event.team_event
      event.category.teams.team_teams
    else
      event.category.teams.player_teams
    end
  end

  def country_name(country_code)
    # There's probably a better way of searching the array of countries
    ActionView::Helpers::FormOptionsHelper::COUNTRIES.each do |country|
      return country[0] if country[1].eql? country_code
    end
    return country_code
  end

  def stars_for(obj)
    html = '<div class="stars">'
    5.times.each_with_index do |idx, elem|
      if idx < obj.rating
        html << (link_to '', {:action => 'rate', :id => obj.id, :rating => idx + 1}, :class => 'star filled')
      else
        html << (link_to '', {:action => 'rate', :id => obj.id, :rating => idx + 1}, :class => 'star')
      end
    end
    html << "</div>"
  end

  def admin_links(obj, extra_class = nil, options = {})
    if extra_class.eql? :none
      html = '<span>'
    else
      html = %Q[ <span class="admin-links #{extra_class}"> ]
    end
    if can? :edit, obj
      html << (link_to '[Edit]', options.merge(:id => obj.id, :action => 'edit'))
    end

    if can? :delete, obj
      html << ' '
      html << (link_to '[Delete]', obj, :method => :delete, :confirm => "Are you sure you want to delete this #{obj.class}?")
    end

    html << '</span>'
  end

  def remove_child_link(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def add_child_link(name, f, method, locals = {})
    fields = new_child_fields(f, method, locals)
    Rails.logger.error(fields)
    link_to_function(name, h("insert_fields(this, \"#{method}\", \"#{escape_javascript(fields)}\")"))
  end

  def new_child_fields(form_builder, method, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(method).klass.new
    options[:partial] ||= method.to_s.singularize
    form_builder.fields_for(method, options[:object], :child_index => "new_#{method}") do |f|
      render(:partial => options[:partial], :locals => options.merge(:f => f))
    end
  end

  def full_name(obj)
    "#{obj.firstname} '#{obj.username}' #{obj.surname}"
  end
end
