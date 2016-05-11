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
end
