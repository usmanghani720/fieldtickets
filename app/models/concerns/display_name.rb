module DisplayName
  extend ActiveSupport::Concern
  
  included do
    before_save :cache_display_name
  end
  
  def cache_display_name
    self[:display_name] = to_s
  end
end