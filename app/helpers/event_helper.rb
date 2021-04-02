module EventHelper

    def event_option
          puts "\n\nevent_option\n\n"
        content_tag(:p, @event.creator.id )+
    content_tag(:p, @event.creator.username )+
      content_tag(:p, @event.description)+
       content_tag(:p,  time_tag( @event.date)) +
      content_tag(:div, class: 'text-right')  do
        if current_user == @event.creator
          (link_to 'Edit', edit_event_path) + tag("br") + 
            (link_to 'Delete', deletee_event_path(@event.id), method: :delete, data: { confirm: 'Delete this event?' })

        elsif @event.attendees.include?(current_user)
          (link_to 'Remove event', cancel_visitor_event_path) 

        else
          (link_to 'Want to Join --- Go ', visitor_event_path unless @event.date < Time.now) 

        end
      end
  end

  def event_option_user
        content_tag(:p, @event.creator.id )+
    content_tag(:p, @event.creator.username )+
      content_tag(:p, @event.description)+
       content_tag(:p,  time_tag( @event.date)) +
      content_tag(:div, class: 'text-right')  do
        if current_user == @event.creator

          (link_to 'Edit', edit_event_path) + tag("br") + 
            (link_to 'Delete', deletee_event_path(@event.id), method: :delete, data: { confirm: 'Delete this event?' })

        elsif @event.attendees.include?(current_user)

          (link_to 'Remove event', cancel_visitor_event_path) 

        else

          (link_to 'Want to Join --- Go ', visitor_event_path unless @event.date < Time.now) 

        end
      end
  end

  def upcoming_events(passed_events)
    all_contents = content_tag(:br)
    passed_events.upcoming.each do |event|
      content = content_tag(:tr, "")
      content << content_tag(:td, event.creator.username)
      content << content_tag(:td, event.name)
      content << content_tag(:td, event.description)
      content << content_tag(:td, event.date)
      all_contents << content
    end
    return all_contents
  end

  def past_events(passed_events)
    all_contents = content_tag(:br)
    passed_events.past.each do |event|
      content = content_tag(:tr, "")
      content = content_tag(:td, event.creator.username)
      content << content_tag(:td, event.name)
      content << content_tag(:td, event.description)
      content << content_tag(:td, event.date)
      content << content_tag(:tr)
      all_contents << content
    end
    return all_contents
  end


  def output_event_errors
    if @event.errors.any?
      content_tag(:div, id: 'error_explanation') +
        content_tag(:div) + 
          content_tag(:p, pluralize(@event.errors.count,"error"))
      @event.errors.full_messages.each do |msg|
        content_tag(:ul) + 
          content_tag(:li, msg)
      end
    end
  end
  
end