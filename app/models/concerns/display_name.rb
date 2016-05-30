# This concern caches a display_name attribute.
# Please define to_s in the model, with the desired output of the display_name.

module DisplayName
  extend ActiveSupport::Concern
  
  included do
    before_save :cache_display_name
  end
  
  # .display_name is simply a cache of .to_s
  def cache_display_name
    self[:display_name] = to_s
  end
  
  # Simple logic doesn't work if to_s relies on another model. This should be resolved in the other model by calling cache_display_name as needed.
  def display_name
    cache_display_name if changed?
      
    self[:display_name]
  end
  
  # Don't allow display_name to be set; it is always calculated programatically.
  def display_name=(new_value)
    raise 'display_name is read only!'
  end
end