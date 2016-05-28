class Vehicle < ActiveRecord::Base
  include DisplayName
  
  TYPES = ['Truck', 'Mill']
  
  acts_as_paranoid
  
  def to_s
    the_string = (internal_number || 'Unnumbered Vehicle')
    the_string << " — #{description}" if description.present?
    the_string
  end
  
end