class Job < ActiveRecord::Base
  include DisplayName
  
  acts_as_paranoid
  
  belongs_to :customer
  has_many :tickets, class_name: 'Ticket::Ticket'
  has_many :employees, through: :tickets, class_name: 'Ticket::Employee'
  has_many :vehicles, through: :tickets, class_name: 'Ticket::Vehicle'
    
  enum billing: { milled_area: 1, day: 2, hour: 3 }
  enum status: { in_progress: 0, completed: 1 }
  
  # Don’t allow a Job to be created if we don’t know how to bill it.
  validates :customer, presence: true
  validates :billing, presence: true
  validates :internal_number, presence: true
  
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
