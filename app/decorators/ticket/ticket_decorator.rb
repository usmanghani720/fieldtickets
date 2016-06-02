class Ticket::TicketDecorator < Draper::Decorator
  delegate_all

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
