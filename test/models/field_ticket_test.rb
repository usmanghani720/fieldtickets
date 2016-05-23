require 'test_helper'

class FieldTicketTest < ActiveSupport::TestCase
  def field_ticket
    @field_ticket ||= FieldTicket.new
  end
  
  def test_square_yards
    field_ticket.length = 225
    field_ticket.width = 36
    assert field_ticket.square_yards == 900
    field_ticket.length = 250
    assert field_ticket.square_yards == 1000
  end
  
  def test_square_feet
    field_ticket.width = 36
    field_ticket.length = 250
    assert field_ticket.square_feet == 9000
  end
end
