class Equipment < ActiveRecord::Base
  VEHICLE_TYPES = ['Truck', 'Mill']
  
  def reference_name
    "#{self.class.human} “#{internal_number}”"
  end
end
