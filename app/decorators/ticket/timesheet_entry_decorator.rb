class Ticket::TimesheetEntryDecorator < Draper::Decorator
  delegate_all

  def status_pretty
    if object.idle? or object.deleted?
      object.status_i18n
    else
      "<strong>#{object.status_i18n}</strong>".html_safe
    end
  end
  
  def duration
    if object.duration
      hours = object.duration / 60
      minutes = object.duration % 60
      
      if hours == 0
        "#{minutes} min"
      elsif minutes == 0
        "#{hours} hr"
      else
        "#{hours} hr #{minutes} min"
      end
    end
  end

end
