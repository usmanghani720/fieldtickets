require "test_helper"

class Ticket::EmployeeTest < ActiveSupport::TestCase
  def employee
    @employee ||= Ticket::Employee.new
  end

  def test_valid
    assert employee.valid?
  end
end
