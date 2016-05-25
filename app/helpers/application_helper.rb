module ApplicationHelper
  include RenamedRoutesHelper
  
  def hide_today_in_date(datetime)
    if datetime.today?
      datetime.pretty_time
    elsif datetime.yesterday?
      'yesterday at ' + datetime.pretty_time
    else
      datetime.pretty
    end
  end
  
  def hours_minutes_display(total_minutes)
    if total_minutes
      minutes = total_minutes % 60
      hours = total_minutes / 60
    
      if hours > 0
        "#{hours} hr #{minutes} min"
      elsif minutes > 0
        "#{minutes} min"
      else
        ''
      end
    end
  end
  
  def partial(partial_name, locals = {})
    render partial: "ticket/shared/#{partial_name}", locals: locals
  end
  
end
