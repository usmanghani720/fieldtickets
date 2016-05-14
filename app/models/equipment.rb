class Equipment < ActiveRecord::Base
  include DisplayName
  
  VEHICLE_TYPES = ['Truck', 'Mill']
  
  acts_as_paranoid
  
  def reference_name
    to_s
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
