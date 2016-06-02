module ApplicationHelper
  def duration(number)
    if number
      hours = number / 60
      minutes = number % 60
    
      if hours == 0
        "#{minutes} min"
      elsif minutes == 0
        "#{hours} hr"
      else
        "#{hours} hr #{minutes} min"
      end
    end
  end
  
  def title(page_title)
    content_for :title, "#{page_title} — BlackRock Milling"
  end
  
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
    rescue ActionView::MissingTemplate
      render partial: "shared/#{partial_path}", locals: locals
    end
  end
  
  def controller?(term, exact = false)
    term = term.to_s
    
    if exact == :exact
      params[:controller] == term
    else
      params[:controller].include? term
    end
  end
  
end
