class Equipment < ActiveRecord::Base
  include DisplayName
  
  VEHICLE_TYPES = ['Truck', 'Mill']
  
  acts_as_paranoid
  
  def reference_name
    to_s
  end
  
  def to_s
    the_string = (internal_number || 'Unnumbered Vehicle')
    the_string << " — #{description}" if description.present?
    the_string
  end
  
end
