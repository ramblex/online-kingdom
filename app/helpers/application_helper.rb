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

  def admin_links(obj, extra_class = nil, options = {}, show_options = {})
    if extra_class.eql? :none
      html = '<span>'
    else
      html = %Q[ <span class="admin-links #{extra_class}"> ]
    end
    if can? :edit, obj and show_options[:no_edit].nil?
      html << (link_to '[Edit]', options.merge(:id => obj.id, :action => 'edit'))
    end

    if can? :delete, obj and show_options[:no_delete].nil?
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

  def title(title)
    if title.split.length > 1
      words = title.split
      html = %Q[<div class="title"><span class="blue">#{words[0]}</span> #{words[1..-1]}</div>]
    else
      mid = (title.length / 2) - 1
      html = %Q[<div class="title"><span class="blue">#{title[0..mid]}</span>#{title[mid+1..-1]}</div>]
    end
    html
  end

  def page_title(title)
    content_for(:page_title) { title }
  end

  class CurrentPageDecorator
    def initialize(helper,options)
      @helper = helper
      @html_class = options[:class] || 'selected button'
      @default = options[:default] || 'as;dklf'
    end

    def link_to(*args, &blk)
      name = args.first
      options = args.second || {}
      html_options = args.third || {}
      html_options[:class] = @html_class if @helper.my_current_page?(options, @default)
      @helper.link_to(name, options, html_options, blk)
    end
  end

  def my_current_page?(options, default)
    params[:category].to_s == options[:category].to_s ||
      (params[:category].nil? && options[:category].to_s == default)
  end

  def highlight_current_link(options= {}, &blk)
    raise ArgumentError unless block_given?
    yield CurrentPageDecorator.new(self, options)
  end

  def my_paginate(collection)
     will_paginate collection,
      :previous_label => '&laquo;',
      :next_label => '&raquo;',
      :inner_window => 1,
      :outer_window => 0
  end
end
