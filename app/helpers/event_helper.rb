module EventHelper

    def event_option
    content_tag(:h1, @event.creator.username )+
      content_tag(:h1, @event.description)+
      content_tag(:h1, @event.date)  do
        if current_user == @event.creator

          (link_to 'Edit', edit_event_path) +
            (link_to 'Delete',event_path, method: :delete, data: { confirm: 'Delete this event?' })

        elsif @event.attendees.include?(current_user)

          (link_to 'Remove event', cancel_visitor_event_path)

        else

          (link_to 'Want to Join --- Go ', visitor_event_path unless @event.date < Time.now)

        end
      end
  end
end