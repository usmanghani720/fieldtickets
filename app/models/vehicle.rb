class Vehicle < ActiveRecord::Base
  include CreatedBy
  include DisplayName
  
  enum vehicle_type: { truck: 1, mill: 2 }  
  validates :vehicle_type, presence: true
  validates :internal_number, presence: true
  
  acts_as_paranoid
  
  def to_s
    the_string = (internal_number || 'Unnumbered Vehicle')
    the_string << " — #{description}" if description.present?
    the_string
  end
  
end