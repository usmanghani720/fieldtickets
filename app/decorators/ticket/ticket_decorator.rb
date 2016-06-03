class Ticket::TicketDecorator < Draper::Decorator
  delegate_all
  
  def employee_hours_pretty
    result = object.employee_hours.clone
    
    result.each do |k,v|
      result[k] = h.duration(v)
    end
    
    result
  end
  
  def mill_hours_pretty
    result = object.mill_hours.clone
    
    result.each do |k,v|
      result[k] = h.duration(v)
    end
    
    result
  end

  def nonmill_hours_pretty
    result = object.nonmill_hours.clone
    
    result.each do |k,v|
      result[k] = h.duration(v)
    end
    
    result
  end

  def milling_square_yards(abbreviate = nil)
    amount = object.milling_square_yards
    
    if abbreviate == :abbreviate
      "#{amount} sq. yd." if amount and amount > 0
    else
      pluralize_or_blank amount, 'square yard'
    end
  end
  
  def delays_total
    pluralize_or_blank object.delays_total, 'hour'
  end
  
  def delays_trucks_pretty
    pluralize_or_blank object.delays_trucks, 'hour'
  end
  
  def delays_paving_pretty
    pluralize_or_blank object.delays_paving, 'hour'
  end
  
  def delays_mot_pretty
    pluralize_or_blank object.delays_mot, 'hour'
  end
  
  def delays_other_pretty
    pluralize_or_blank object.delays_other, 'hour'
  end
  
  def approval
    if not object.pending_approval?
      object.approval
    end
  end
  
  def bill_to_pretty
    "#{object.bill_to_i18n} #{object.job}"
  end
  
  private
    def pluralize_or_blank(count, name)
      if count.to_i == count
        count = count.to_i
      end
      
      if count.nil? or count <= 0
        ''
      else
        h.pluralize count, name
      end
    end

end
