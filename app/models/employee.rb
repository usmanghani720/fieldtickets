class Employee < ActiveRecord::Base
  before_save :cache_display_name
  
  def to_s
    if nickname.present? and internal_number.present?
      "“#{nickname}” #{name} (##{internal_number})"
    elsif internal_number.present?
      "#{name} (##{internal_number})"
    elsif nickname.present?
      "“#{nickname}” #{name}"
    else
      name
    end
  end
  
  def cache_display_name
    self[:display_name] = to_s
  end
end
