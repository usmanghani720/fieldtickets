require "test_helper"

class TicketTest < ActiveSupport::TestCase
  def ticket
    @ticket ||= Ticket.new
  end
  
  def job
    @job ||= Job.create(billing: 1)
  end

  def test_valid
    assert ticket.valid?
  end
  
  # After changing bill_to to something other than Job or Job Cancelled, it should no longer require a job number
  def test_job_required
    assert ticket.job_required?
    ticket.bill_to = 'Office Staff'
    refute ticket.job_required?
    ticket.bill_to = 1
    assert ticket.job_required?
  end
  
  # After changing bill_to to something other than Job or Job Cancelled, it should remove the Job from the Ticket
  def test_job_removed_upon_change
    ticket.job = job
    assert ticket.job
    ticket.bill_to = 'Weather'
    ticket.save
    refute ticket.job
  end
  
  # Basic math sanity check
  def test_milling_square_yards
    ticket.milling_length = 225
    ticket.milling_width = 36
    assert ticket.milling_square_yards == 900
    ticket.milling_length = 250
    assert ticket.milling_square_yards == 1000
  end
  
  # Basic math sanity check
  def test_milling_square_feet
    ticket.milling_width = 36
    ticket.milling_length = 250
    assert ticket.milling_square_feet == 9000
  end
  
  # Make sure it won't let crappy dimensions in
  def test_milling_dimensions_validations
    ticket.milling_width = 36
    refute ticket.valid?
    ticket.milling_length = 250
    refute ticket.valid?
    ticket.milling_depth = 30
    refute ticket.valid?
    ticket.milling_depth = 1
    assert ticket.valid?
    ticket.milling_width = 0
    refute ticket.valid?
  end
  
  # Make sure it validates approval okay
  def test_approval
    ticket.approval = :approved
    refute ticket.valid?
    ticket.approval_name_and_title = 'Mark'
    refute ticket.valid?
    ticket.approval_signature = "data:image/png;base64,iVBORw0KGgoAAAANS"
    refute ticket.valid?
    ticket.approval_name_and_title = 'Mark Twain, VP'
    refute ticket.valid?
    ticket.approval_email = 'a@me.com'
    assert ticket.valid?
    ticket.approval_email = 'a@'
    refute ticket.valid?
  end
  
end
