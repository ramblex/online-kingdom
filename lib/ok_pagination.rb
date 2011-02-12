class OkPagination < WillPaginate::LinkRenderer
  def to_html
    links = @options[:page_links] ? windowed_links : []

    links.unshift(page_link(@collection.previous_page, '&laquo;', :class => 'button'))
    links.push(page_link(@collection.next_page, '&raquo;', :class => 'button'))

    html = links.join(@options[:separator])
    @options[:container] ? @template.content_tag(:ul, html, {:class => 'switcher'}) : html
  end

protected

  def windowed_links
    prev = nil

    visible_page_numbers.inject [] do |links, n|
      # detect gaps:
      links << gap_marker if prev and n > prev + 1
      links << page_link(n, n.to_s, :class => (n == current_page ? 'button selected' : 'button'))
      prev = n
      links
    end
  end

  def page_link(page, text, attributes = {})
    if page.nil?
      @template.content_tag(:li, @template.link_to(text, nil, attributes))
    else
      @template.content_tag(:li, @template.link_to(text, url_for(page), attributes))
    end
  end
end
