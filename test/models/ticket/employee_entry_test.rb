require "test_helper"

class Ticket::EmployeeEntryTest < ActiveSupport::TestCase
  def employee_entry
    @employee_entry ||= Ticket::EmployeeEntry.new
  end

  def test_invalid
    refute employee_entry.valid?
  end
end
