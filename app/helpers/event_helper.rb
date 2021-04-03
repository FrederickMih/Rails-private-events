# rubocop:disable Metrics/ModuleLength
# rubocop:disable Lint/UselessAssignment
# rubocop:disable Style/GuardClause
# rubocop:disable Lint/Void

module EventHelper
  def event_option
    puts "\n\nevent_option\n\n"
    content_tag(:p, @event.creator.id) +
      content_tag(:p, @event.creator.username) +
      content_tag(:p, @event.description) +
      content_tag(:p, time_tag(@event.date)) +
      content_tag(:div, class: 'text-right') do
        if current_user == @event.creator
          (link_to 'Edit', edit_event_path) + tag('br') +
            (link_to 'Delete', deletee_event_path(@event.id), method: :delete,
                                                              data: { confirm: 'Delete this event?' })

        elsif @event.attendees.include?(current_user)
          (link_to 'Remove event', cancel_visitor_event_path)

        else
          (link_to 'Want to Join --- Go ', visitor_event_path unless @event.date < Time.now)

        end
      end
  end

  def event_option_user
    content_tag(:p, @event.creator.id) +
      content_tag(:p, @event.creator.username) +
      content_tag(:p, @event.description) +
      content_tag(:p, time_tag(@event.date)) +
      content_tag(:div, class: 'text-right') do
        if current_user == @event.creator

          (link_to 'Edit', edit_event_path) + tag('br') +
            (link_to 'Delete', deletee_event_path(@event.id), method: :delete,
                                                              data: { confirm: 'Delete this event?' })

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
      content = content_tag(:tr, '')
      # content << content_tag(:td, event.creator.username)
      content << content_tag(:td, event.name)
      content << content_tag(:td, event.description)
      content << content_tag(:td, event.date)
      all_contents << content
    end
    all_contents
  end

  def user_upcoming_events(user)
    all_contents = content_tag(:tr)
    user.attended_events.upcoming.each do |event|
      content = content_tag(:tr, '')
      content << content_tag(:td, event.name)
      content << content_tag(:td, event.description)
      content << content_tag(:td, event.date)
      content << content_tag(:br)
      all_contents << content
    end
    all_contents
  end

  def user_past_events(user)
    all_contents = content_tag(:tr)
    user.attended_events.past.each do |event|
      content = content_tag(:tr, '')
      content << content_tag(:td, event.name)
      content << content_tag(:td, event.description)
      content << content_tag(:td, event.date)
      content << content_tag(:br)
      all_contents << content
    end
    all_contents
  end

  def past_events(passed_events)
    all_contents = content_tag(:br)
    passed_events.past.each do |event|
      content = content_tag(:tr, '')
      # content = content_tag(:td, event.creator.username)
      content << content_tag(:td, event.name)
      content << content_tag(:td, event.description)
      content << content_tag(:td, event.date)
      content << content_tag(:tr)
      all_contents << content
    end
    all_contents
  end

  def output_user_errors(user)
    if user.errors.any?
      content_tag(:div, id: 'error_explanation') +
        content_tag(:div) +
        content_tag(:p, pluralize(user.errors.count, 'error'))
      user.errors.full_messages.each do |msg|
        content_tag(:ul) +
          content_tag(:li, msg)
      end
    end
  end

  def show_user_created_events(user)
    all_contents = content_tag(:br)
    if user.events.empty?
      all_contents << content_tag(:h3, "#{user.username} Dind't make any events")
    else
      all_contents << content_tag(:h3, "Number of events made: #{@user.events.size}")
      all_events = user.events
      all_events.each do |e|
        all_contents << content_tag(:p, e.description)
      end
    end
    all_contents
  end

  def output_event_errors
    if @event.errors.any?
      content_tag(:div, id: 'error_explanation') +
        content_tag(:div) +
        content_tag(:p, pluralize(@event.errors.count, 'error'))
      @event.errors.full_messages.each do |msg|
        content_tag(:ul) +
          content_tag(:li, msg)
      end
    end
  end
end
# rubocop:enable Metrics/ModuleLength
# rubocop:enable Lint/UselessAssignment
# rubocop:enable Style/GuardClause
# rubocop:enable Lint/Void
