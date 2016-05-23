class Job < ActiveRecord::Base
  include DisplayName
  
  acts_as_paranoid
  
  belongs_to :customer
  has_many :field_tickets
  has_many :equipment_entries, through: :field_tickets
  has_many :employee_entries, through: :field_tickets
    
  enum billing: { day_rate: 1, square_yards: 2, hourly: 3 }
  enum status: { in_progress: 0, completed: 1 }
  
  validates :billing, presence: true
  
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
    "##{internal_number} — #{customer_name}"
  end
  
  def reference_name
    to_s
  end
  
end
