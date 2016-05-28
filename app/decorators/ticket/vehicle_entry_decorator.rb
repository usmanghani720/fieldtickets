class Ticket::VehicleEntryDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  
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
