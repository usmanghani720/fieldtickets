class Equipment < ActiveRecord::Base
  include DisplayName
  
  VEHICLE_TYPES = ['Truck', 'Mill']
  
  def reference_name
    internal_number
  end
  
  def model_reference_name
    "#{humanize} # #{reference_name}"
  end
  
  def to_s
    if description
      "##{internal_number} — #{description}"
    else
      internal_number
    end
  end
  
end
