class Ticket::TimesheetEntryDecorator < Draper::Decorator
  delegate_all

  # def status
  #   if object.idle?
  #     object.status.titleize
  #   else
  #     "<strong>#{object.status.titleize}</strong>".html_safe
  #   end
  # end
  
  def duration
    if not object.duration
    else
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
