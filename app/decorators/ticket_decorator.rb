class TicketDecorator < Draper::Decorator
  delegate_all

  def milling_square_yards
    pluralize_or_blank object.milling_square_yards, 'square yard'
  end
  
  def delays_total
    pluralize_or_blank object.delays_total, 'hour'
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
