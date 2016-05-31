module ApplicationHelper
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
  
  # Render the partial (shared or not)
  def partial(partial_path, locals = {})
    begin
      render partial: partial_path, locals: locals
    rescue
      render partial: "shared/#{partial_path}", locals: locals
    end
  end
  
  def controller?(term)
    params[:controller].include? term.to_s
  end
  
end
