class Job < ActiveRecord::Base
  belongs_to :customer
  
  def billing
    if flat_rate
      'Day Rate'
    else
      'Hourly'
    end
  end
  
  def customer_name=(name)
    self.customer = Customer.find_or_create_by(name: name)
  end
  
  def customer_name
    if customer
      customer.name
    else
      ''
    end
  end
  
end
