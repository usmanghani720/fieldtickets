class Job < ActiveRecord::Base
  belongs_to :customer
  has_many :field_tickets
  has_many :equipment_entries, through: :field_tickets
  has_many :employee_entries, through: :field_tickets
  
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
  
  def to_s
    "#{internal_number} — #{customer_name}"
  end
  
end
