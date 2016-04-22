module DateHelper
  def format_datetime(datetime)
    format_date(datetime) + ' at ' + format_time(datetime)
  end
  
  def format_date(datetime)
    datetime.strftime('%b %-d, %Y')
  end
  
  def format_time(datetime)
    datetime.strftime('%l:%M %P')
  end
  
end
