require 'test_helper'

class EmployeeEntryTest < ActiveSupport::TestCase
  def employee_entry
    @employee_entry ||= EmployeeEntry.new
  end
end
