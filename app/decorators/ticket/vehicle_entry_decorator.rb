class Ticket::VehicleEntryDecorator < Draper::Decorator
  delegate_all

  def status
    if object.idle?
      object.status.titleize
    else
      "<strong>#{object.status.titleize}</strong>".html_safe
    end
  end
  
  def duration
    if not object.duration
    elsif object.duration == 1
      '1 minute'
    elsif object.duration < 60
      "#{object.duration} minutes"
    elsif object.duration == 60
      "1 hour"
    else
      "#{object.duration / 60} hours"
    end
  end

end
