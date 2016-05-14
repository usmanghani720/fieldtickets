class Equipment < ActiveRecord::Base
  VEHICLE_TYPES = ['Truck', 'Mill']
  
  before_save :cache_display_name
  
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
  
  def cache_display_name
    self[:display_name] = to_s
  end
end
