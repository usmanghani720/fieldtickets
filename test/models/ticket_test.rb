require "test_helper"

class TicketTest < ActiveSupport::TestCase
  def ticket
    @ticket ||= Ticket.new
  end

  def test_valid
    assert ticket.valid?
  end
  
  # After changing bill_to to something other than Job or Job Cancelled, it should no longer require a job number
  def test_job_required
    assert ticket.job_required?
    ticket.bill_to = 'Office Staff'
    refute ticket.job_required?
  end
  
  
end
