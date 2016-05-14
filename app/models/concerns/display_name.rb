module DisplayName
  extend ActiveSupport::Concern
  
  included do
    before_save :cache_display_name
  end
  
  def cache_display_name
    self[:display_name] = to_s
  end
  
  def display_name
    # simple logic doesn't work if to_s relies on another model
    
    cache_display_name if changed?
      
    self[:display_name]
  end
  
  def display_name=(new_value)
    raise 'display_name is read only!'
  end
end