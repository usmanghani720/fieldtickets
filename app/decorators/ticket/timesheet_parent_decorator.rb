class Ticket::TimesheetParentDecorator < Draper::Decorator
  delegate_all
  
  def status
    object.status.titleize
  end

  def status_pretty
    if object.idle? or object.deleted?
      object.status_i18n
    else
      "<strong>#{object.status_i18n}</strong>".html_safe
    end
  end
  
  def hours_pretty
    result = object.hours.clone
    
    result.each do |k,v|
      result[k] = h.duration(v)
    end
    
    result
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
