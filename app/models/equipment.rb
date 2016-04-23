class Equipment < ActiveRecord::Base
  VEHICLE_TYPES = ['Truck', 'Mill']
  
  def reference_name
    internal_number
  end
  
  def model_reference_name
    "#{humanize} # #{reference_name}"
  end
end
