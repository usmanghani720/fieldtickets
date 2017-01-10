class Vehicle < ActiveRecord::Base
  include CreatedBy
  include DisplayName
  
  has_many :ticket_vehicles, class_name: 'Ticket::Vehicle'
  has_many :tickets, through: :ticket_vehicles, class_name: 'Ticket::Ticket'
  
  enum vehicle_type: { truck: 1, mill: 2 }  
  validates :vehicle_type, presence: true
  validates :internal_number, presence: true
  
  acts_as_paranoid
  
  before_save :name_searchable
  
  after_save :update_ticket_vehicles
  
  def to_s
    the_string = ''
    the_string << (internal_number || 'Unnumbered Vehicle')
    the_string << " — #{description}" if description.present?
    the_string
  end
  
  def name_searchable
    self[:name_searchable] = to_s.searchable
  end
  
  private
  
    def update_ticket_vehicles
      if display_name_changed?
        ticket_vehicles.each do |vehicle|
          vehicle.cache_display_name!
        end
      end
    end
  
end