class Ticket::EmployeeDecorator < Draper::Decorator
  delegate_all

  def status
    object.status.titleize
  end
  
  def hours_pretty
    result = object.hours.clone
    
    result.each do |k,v|
      result[k] = h.duration(v)
    end
    
    result
  end

end