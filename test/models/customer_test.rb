require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  def customer
    @customer ||= Customer.new
  end

  def test_valid
    assert customer.valid?
  end
  
  def test_to_s
    customer.name = 'Marty McFly'
    assert customer.to_s == 'Marty McFly'
  end
end
