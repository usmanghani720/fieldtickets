SimpleForm::ErrorNotification.class_eval do
  #def render
  #  if has_errors?
  #    template.content_tag(error_notification_tag, 'error_message', html_options)
  #  end
  #end
  
  def error_message
    case errors.count
      when 1
        'Oops! Just one issue:'
      when 2
        'Oops! Just a couple issues:'
      else
        'Oops! Just a few issues:'
    end
  end
end