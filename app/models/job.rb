class Job < ActiveRecord::Base
  include DisplayName
  
  acts_as_paranoid
  
  belongs_to :customer
  has_many :field_tickets
  has_many :equipment_entries, through: :field_tickets
  has_many :employee_entries, through: :field_tickets
    
  enum billing: { day_rate: 1, square_yards: 2, hourly: 3 }
  enum status: { in_progress: 0, completed: 1 }
  
  # Don’t allow a Job to be created if we don’t know how to bill it.
  validates :billing, presence: true
  
  # When customer_name is set, find or create a customer by that name
  def customer_name=(name)
    self.customer = Customer.find_or_create_by(name: name)
  end
  
  # Acme Construction
  def customer_name
    if customer
      customer.name
    end
  end
  
  # #23 - Acme Construction
  def to_s
    "##{internal_number} — #{customer_name}"
  end
  
end
