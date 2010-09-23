module EventsHelper
  def event_dates(event)
    if event.start_date and event.end_date
      html = (event.start_date.strftime('%e %b %Y'))
      if event.start_date != event.end_date
        html << ' to ' << (event.end_date.strftime('%e %b %Y'))
      end
      html
    end
  end
end
