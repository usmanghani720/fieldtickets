require 'test_helper'

class JobTest < ActiveSupport::TestCase
  def job
    @job ||= Job.new
  end
  
  def new_customer
    Customer.where name: 'Dolores Moseley Inc'
  end
  
  # Job is not valid until billing is set.
  # Here, billing is set with .hourly!
  def test_must_input_billing
    refute job.valid?
    job.hourly!
    assert job.valid?
  end
  
  # Job must allow customer creation!
  def test_must_allow_customer_creation
    old_count = Customer.count
    
    assert new_customer.blank?
    job.customer_name = 'Dolores Moseley Inc'
    refute new_customer.blank?
    
    new_count = Customer.count
    assert old_count == new_count - 1
  end
  
  def test_must_have_customer_name
    job.customer_name = 'Dolores Moseley Inc'
    assert job.customer_name == 'Dolores Moseley Inc'
  end
end
