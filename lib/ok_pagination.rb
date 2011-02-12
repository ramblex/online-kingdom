class OkPagination < WillPaginate::LinkRenderer
  def to_html
    links = @options[:page_links] ? windowed_links : []

    links.unshift(page_link_or_span(@collection.previous_page, 'previous', '&laquo;'))
    links.push(page_link_or_span(@collection.next_page, 'next', '&raquo;'))

    html = links.join(@options[:separator])
    @options[:container] ? @template.content_tag(:ul, html, {:class => 'switcher'}) : html
  end

protected

  def windowed_links
    prev = nil

    visible_page_numbers.inject [] do |links, n|
      # detect gaps:
      links << gap_marker if prev and n > prev + 1
      links << page_link_or_span(n, (n == current_page ? 'button selected' : nil))
      prev = n
      links
    end
  end

  def page_link_or_span(page, span_class, text = nil)
    text ||= page.to_s
    if page && page != current_page
      page_link(page, text, :class => span_class)
    else
      page_span(page, text, :class => span_class)
    end
  end

  def page_link(page, text, attributes = {})
    @template.content_tag(:li, @template.link_to(text, url_for(page), :class => 'button'), attributes)
  end

  def page_span(page, text, attributes = {})
    @template.content_tag(:li, text, attributes)
  end
end
