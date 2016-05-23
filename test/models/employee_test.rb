require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  def employee
    @employee ||= Employee.new
  end
  
  def test_plain_name
    employee.name = 'Oliver'
    assert employee.to_s == 'Oliver', msg: employee.to_s
  end
  
  def test_blank_name
    assert employee.to_s == 'Unnamed Employee'
  end
  
  def test_nickname
    employee.nickname = 'Gator'
    assert employee.to_s == '“Gator” Unnamed Employee'
  end
  
  def test_internal_number
    employee.internal_number = '007'
    assert employee.to_s == 'Unnamed Employee (007)'
  end
  
  def test_all_names
    employee.name = 'Oliver Anson'
    employee.internal_number = '00005'
    employee.nickname = 'Olie'
    
    assert employee.to_s == '“Olie” Oliver Anson (00005)'
  end
  
  def test_can_log_in
    refute employee.can_log_in?
    employee.email = 'oliver@ok.com'
    refute employee.can_log_in?
    employee.password = 'goat'
    assert employee.can_log_in?
  end
end
