class Vehicle < ActiveRecord::Base
  include DisplayName
  
  enum vehicle_type: { truck: 1, mill: 2 }
  
  acts_as_paranoid
  
  def to_s
    the_string = (internal_number || 'Unnumbered Vehicle')
    the_string << " — #{description}" if description.present?
    the_string
  end
  
end